{
  flake.modules.homeManager.base = {lib, ...}: {
    home = {
      stateVersion = lib.mkDefault "25.05";
      sessionPath = ["$HOME/.local/bin"];
      sessionVariables.NIXPKGS_ALLOW_UNFREE = "1";
    };

    programs.home-manager.enable = true;
  };
}
