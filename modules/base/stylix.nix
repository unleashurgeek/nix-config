{inputs, ...}: {
  flake.modules.nixos.base = {
    imports = [inputs.stylix.nixosModules.stylix];
  };

  flake.modules.homeManager.base = {pkgs, ...}: {
    imports = [inputs.stylix.homeModules.stylix];

    stylix = {
      autoEnable = false;
      polarity = "dark";

      cursor = {
        package = pkgs.apple-cursor; # bibata-cursor, rose-pine-cursor
        name = "macOS";
        size = 20;
      };

      fonts = {
        monospace = {
          name = "FiraCode Nerd Font";
          package = pkgs.nerd-fonts.fira-code;
        };
        sansSerif = {
          name = "Fira Sans";
          package = pkgs.fira;
        };
        serif = {
          name = "Fira Sans";
          package = pkgs.fira;
        };
      };

      iconTheme = {
        enable = true;
        dark = "Papirus-Dark";
        light = "Papirus-Light";
        package = pkgs.papirus-icon-theme;
      };
    };
  };
}
