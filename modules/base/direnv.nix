{
  flake.modules.homeManager.base = _: {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
