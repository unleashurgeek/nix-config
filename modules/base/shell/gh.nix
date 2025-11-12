{
  flake.modules.nixos.base = {
    hostConfig,
    lib,
    ...
  }: {
    preservation.preserveAt."/persist".users =
      lib.mapAttrs (_: _: {
        files = [".config/gh/hosts.yml"];
      })
      hostConfig.users;
  };

  flake.modules.homeManager.base = {
    programs.gh = {
      enable = true;
      settings = {
        git_protocol = "ssh";
      };
    };
  };
}
