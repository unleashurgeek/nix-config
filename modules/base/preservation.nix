{
  flake.modules.nixos.base = {
    hostConfig,
    pkgs,
    inputs,
    lib,
    ...
  }: {
    imports = [
      inputs.preservation.nixosModules.default
    ];

    preservation.enable = hostConfig.preservation.enable;
    # pverservation required initrd using systemd.
    boot.initrd.systemd.enable = true;

    environment.systemPackages = with pkgs; [
      # `sudo ncdu -x /`
      ncdu
    ];

    # TODO: iterate all users in hostConfig
    preservation.preserveAt."/persist".users = lib.mapAttrs (_: _: {
      commonMountOptions = [
        "x-gvfs-hide"
      ];
    }) hostConfig.users;
  };
}