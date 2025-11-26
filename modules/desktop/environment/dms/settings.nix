{
  flake.modules.homeManager.desktop-dms = {
    programs.dankMaterialShell.default.settings = {
      theme = "dark";

      use24HourClock = false;
      showSeconds = false;
      useFahrenheit = true;
      weatherLocation = "Marysville, WA";

      controlCenterWidgets = [
        {
          id = "volumeSlider";
          enabled = true;
          width = 100;
        }
        {
          id = "audioOutput";
          enabled = true;
          width = 50;
        }
        {
          id = "audioInput";
          enabled = true;
          width = 50;
        }
        {
          id = "diskUsage";
          enabled = true;
          width = 50;
        }
        {
          id = "wifi";
          enabled = true;
          width = 50;
        }
      ];

      barConfigs = [
        {
          id = "default";
          name = "Main Bar";
          enabled = true;
          position = 0;
          screenPreferences = ["all"];
          showOnLastDisplay = true;
          leftWidgets = [
            {
              id = "launcherButton";
              enabled = true;
            }
            "workspaceSwitcher"
          ];
          centerWidgets = [
            {
              id = "music";
              enabled = true;
              mediaSize = 2;
            }
          ];
          rightWidgets = [
            {
              id = "systemTray";
              enabled = true;
            }
            {
              id = "notificationButton";
              enabled = true;
            }
            {
              id = "controlCenterButton";
              enabled = true;
            }
            {
              id = "clock";
              enabled = true;
              clockCompactMode = true;
            }
          ];
          spacing = 0;
          innerPadding = 24;
          bottomGap = -16;
          transparency = 0;
          widgetTransparency = 1;
          squareCorners = false;
          noBackground = false;
          gothCornersEnabled = false;
          borderEnabled = false;
          widgetOutlineEnabled = false;
          autoHide = false;
          fontScale = 1;
          visible = true;
          popupGapsAuto = true;
        }
      ];
    };
  };
}
