{
  flake.modules.nixos.base = {
    hostConfig,
    lib,
    ...
  }: {
    preservation.preserveAt."/persist".users =
      lib.mapAttrs (_: _: {
        directories = [".local/share/zoxide"];
      })
      hostConfig.users;
  };

  flake.modules.homeManager.base = {
    programs.zoxide = {
      enable = true;
      options = [
        "--cmd cd" # replaces "cd"
      ];
    };
  };
}
