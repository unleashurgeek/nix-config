{
  flake.modules.homeManager.desktop-simple = {pkgs, ...}: {
    home.packages = with pkgs; [
      grim
      grimblast
      slurp
      hyprpicker
      stable.wl-screenrec
      cliphist
      wl-clipboard
    ];
  };
}
