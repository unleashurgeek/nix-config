{
  flake.modules.homeManager.desktop = {pkgs, ...}: {
    home.packages = with pkgs; [
      youtube-music
    ];

    wayland.windowManager.hyprland.settings = {
      windowrulev2 = let
        class = "com.github.th_ch.youtube_music";
      in [
        "float, class:${class}"
        "animation popout, class:${class}"
      ];
    };
  };

  flake.modules.nixos.desktop = {
    preserve.users.directories = [".config/YouTube Music"];
  };
}
