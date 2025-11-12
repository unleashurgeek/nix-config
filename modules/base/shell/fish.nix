{
  flake.modules.nixos.base = {
    hostConfig,
    lib,
    ...
  }: {
    programs.fish = {
      enable = true;
      vendor = {
        completions.enable = true;
        config.enable = true;
        functions.enable = true;
      };
    };

    preservation.preserveAt."/persist".users =
      lib.mapAttrs (_: _: {
        directories = [".local/share/fish"];
      })
      hostConfig.users;
  };

  flake.modules.homeManager.base = {
    programs.fish = {
      enable = true;
      functions = {
        fish_greeting = "";
      };
      shellAliases = {
        ".." = "cd ..";
        "..." = "cd ../..";
        cat = "bat";
        ls = "eza";
        grep = "rg";
      };
    };
  };
}
