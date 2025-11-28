{
  flake.modules.nixos.desktop = {
    programs._1password-gui = {
      enable = true;
      polkitPolicyOwners = ["kyle"];
    };

    preserve.users.directories = [
      {
        directory = ".config/1Password";
        mode = "0700";
      }
    ];
  };

  flake.modules.homeManager.desktop = {
    wayland.windowManager.hyprland.settings = {
      exec-once = [
        "sleep 1 && app2unit -s s -- 1password --silent"
      ];

      windowrulev2 = [
        "float, class:1password"
      ];

      bind = [
        # "$MOD, T, exec, app2unit -- 1password --quick-access"
      ];
    };
  };
}
