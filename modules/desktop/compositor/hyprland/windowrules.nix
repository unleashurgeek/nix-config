{
  flake.modules.homeManager.desktop-hyprland = {
    wayland.windowManager.hyprland.settings = {
      # Generic window rules that should be mostly app agnostic
      windowrulev2 = [
        "float, class:floating.terminal"
        "size 50% 50%, class:floating.terminal"
      ];
    };
  };
}
