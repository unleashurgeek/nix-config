{
  flake.modules.nixos.base = {
    inputs,
    pkgs,
    lib,
    hostConfig,
    ...
  }: {
    imports = [inputs.preservation.nixosModules.default];

    environment.systemPackages = with pkgs; [
      # `sudo ncdu -x /`
      ncdu
    ];

    preservation.preserveAt."/persist" = {
      directories = [
        "/etc/NetworkManager/system-connections"
        "/etc/nix/inputs"

        # system-core
        "/var/log"
        "/var/lib/nixos"
        "/var/lib/systemd"
        {
          directory = "/var/lib/private";
          mode = "0700";
        }

        # containers
        "/var/lib/containers"

        # virtualization
        "/var/lib/libvirt"

        # network
        "/var/lib/bluetooth"
        "/var/lib/NetworkManager"
        "/var/lib/iwd"
      ];
      files = [
        # auto-generated machine ID
        {
          file = "/etc/machine-id";
          inInitrd = true;
        }
      ];

      users =
        lib.mapAttrs (_: _: {
          commonMountOptions = [
            "x-gvfs-hide"
          ];
          directories = [
            # XDG Directories
            "Music"
            "Pictures"
            "Documents"
            "Videos"
            #"Downloads"

            # nix-config repo
            ".nix-config"

            # Nix / Home Manager Profiles
            ".local/share/nix"
            ".local/state/home-manager"
            ".local/state/nix/profiles"

            # language package managers
            ".local/bin"
          ];
        })
        hostConfig.users;
    };

    systemd.tmpfiles.settings.preservation = let
      paths = user: let
        permission = {
          inherit user;
          group = user;
          mode = "0755";
        };
      in {
        "/home/${user}/.config".d = permission;
        "/home/${user}/.local".d = permission;
        "/home/${user}/.local/share".d = permission;
        "/home/${user}/.local/state".d = permission;
      };
    in
      lib.mergeAttrsList (lib.attrsets.mapAttrsToList (name: _: (paths name)) hostConfig.users);

    systemd.suppressedSystemUnits = ["systemd-machine-id-commit.service"];

    # let the service commit the transient ID to the persistent volume
    systemd.services.systemd-machine-id-commit = {
      unitConfig.ConditionPathIsMountPoint = [
        ""
        "/persist/etc/machine-id"
      ];
      serviceConfig.ExecStart = [
        ""
        "systemd-machine-id-setup --commit --root /persist"
      ];
    };
  };
}
