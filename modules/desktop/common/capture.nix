{
  flake.modules.homeManager.desktop = {pkgs, ...}: {
    home.packages = with pkgs; [
      grim
      grimblast
      slurp
      stable.wl-screenrec
    ];
  };
}
