{
  flake.modules.nixos.base = {
    inputs,
    outputs,
    lib,
    ...
  }: {
    nixpkgs = {
      overlays = builtins.attrValues outputs.overlays;
      config = {
        allowUnfree = true;
      };
    };

    nix = {
      settings = {
        trusted-users = ["root" "@wheel"];
        experimental-features = "nix-command flakes pipe-operators";
        auto-optimise-store = true;
      };

      gc = {
        automatic = true;
        dates = "*-*-* 03:00:00 America/Los_Angeles";
        options = "--delete-older-than 8d";
      };

      # Add each flake input to nix registry
      registry = lib.mapAttrs (_: value: {flake = value;}) inputs;
    };

    preservation.preserveAt."/persist".directories = ["/root/.local/share/nix"];
  };

  flake.modules.homeManager.base = {
    outputs,
    lib,
    pkgs,
    ...
  }: {
    home.sessionVariables.FLAKE = lib.mkDefault "~/.nix-config";

    nixpkgs = {
      overlays = builtins.attrValues outputs.overlays;
      config = {
        allowUnfree = true;
      };
    };

    nix = {
      package = lib.mkDefault pkgs.nix;
      settings = {
        experimental-features = [
          "nix-command"
          "flakes"
          "pipe-operators"
        ];
        warn-dirty = false;
      };
    };

    # Nicely reload system units when changing configs
    systemd.user.startServices = "sd-switch";
  };
}