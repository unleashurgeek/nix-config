{
  flake.modules.homeManager.desktop = {lib, ...}: {
    programs.firefox.profiles.default.settings = {
      "browser.tabs.closeWindowWithLastTab" = false;

      # New tab page junk
      "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
      "browser.newtabpage.activity-stream.feeds.weatherfeed" = false;
      "browser.newtabpage.activity-stream.showSponsored" = false;
      "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
      "browser.newtabpage.activity-stream.showWeather" = false;
      "browser.newtabpage.activity-stream.system.showSponsored" = false;
      "browser.newtabpage.activity-stream.system.showWeather" = false;
      "browser.newtabpage.activity-stream.weather.locationSearchEnabled" = false;
      "browser.newtabpage.activity-stream.feeds.topsites" = false;
      "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts" = false;
      "browser.newtabpage.blocked" = lib.genAttrs [
        # Youtube
        "26UbzFJ7qT9/4DhodHKA1Q=="
        # Facebook
        "4gPpjkxgZzXPVtuEoAL9Ig=="
        # Wikipedia
        "eV8/WsSLxHadrTL1gAxhug=="
        # Reddit
        "gLv0ja2RYVgxKdp0I5qwvA=="
        # Amazon
        "K00ILysCaEq8+bEqV/3nuw=="
        # Twitter
        "T9nJot5PurhJSy8n038xGA=="
      ] (_: 1);

      # Prevent Firefox from warning before going to about:config
      "browser.aboutConfig.showWarning" = false;

      # Don't try to store passwords
      "signon.rememberSignons" = false;

      # Prevent Firefox from suggesting to re-open tabs from last session
      "browser.startup.couldRestoreSession.count" = -1;

      # Default Ctrl-F to highlight all results by default
      "findbar.highlightAll" = true;

      # Allow extensions to be auto-enabled
      "extensions.autoDisableScopes" = 0;
      "extensions.update.autoUpdateDefault" = false;
      "extensions.update.enabled" = false;

      "sidebar.revamp" = true;
      "sidebar.revamp.round-content-area" = true;
      "sidebar.verticalTabs" = true;
      "sidebar.main.tools" = "aichat,history,bookmarks";
      # "sidebar.visibility" = "expand-on-hover";
      "sidebar.backupState" = {
        "launcherWidth" = 64;
        "expandedLauncherWidth" = 256;
        "launcherExpanded" = false;
        "launcherVisible" = true;
        "panelOpen" = false;
      };

      "browser.tabs.inTitlebar" = 1;
      "browser.theme.toolbar-theme" = 0;
      "browser.toolbarbuttons.introduced.sidebar-button" = true;
      "browser.toolbars.bookmarks.visibility" = "always";
      "browser.uiCustomization.navBarWhenVerticalTabs" = [
        "back-button"
        "forward-button"
        "stop-reload-button"
        "customizableui-special-spring1"
        "vertical-spacer"
        "urlbar-container"
        "customizableui-special-spring2"
        "save-to-pocket-button"
        "downloads-button"
        "unified-extensions-button"
        "fxa-toolbar-menu-button"
        "ublock0_raymondhill_net-browser-action"
        "keepassxc-browser_keepassxc_org-browser-action"
        "library-button"
        "sidebar-button"
        "history-panelmenu"
        "firefox-view-button"
        "alltabs-button"
      ];
      "browser.uiCustomization.horizontalTabstrip" = [
        "firefox-view-button"
        "tabbrowser-tabs"
        "new-tab-button"
        "alltabs-button"
      ];
      "browser.uiCustomization.state" = {
        "placements" = {
          "widget-overflow-fixed-list" = [];
          "unified-extensions-area" = [
            "sponsorblocker_ajay_app-browser-action"
            "firefoxcolor_mozilla_com-browser-action"
          ];
          "nav-bar" = [
            "back-button"
            "forward-button"
            "stop-reload-button"
            "customizableui-special-spring1"
            "vertical-spacer"
            "urlbar-container"
            "customizableui-special-spring2"
            "downloads-button"
            "unified-extensions-button"
            "zotero_chnm_gmu_edu-browser-action"
            "ublock0_raymondhill_net-browser-action"
            "keepassxc-browser_keepassxc_org-browser-action"
            "library-button"
            # "sidebar-button"
            "alltabs-button"
          ];
          "toolbar-menubar" = ["menubar-items"];
          "TabsToolbar" = [];
          "vertical-tabs" = ["tabbrowser-tabs"];
          "PersonalToolbar" = ["personal-bookmarks"];
        };
        "seen" = [
          "firefoxcolor_mozilla_com-browser-action"
          "keepassxc-browser_keepassxc_org-browser-action"
          "sponsorblocker_ajay_app-browser-action"
          "ublock0_raymondhill_net-browser-action"
          "developer-button"
        ];
        "dirtyAreaCache" = [
          "unified-extensions-area"
          "nav-bar"
          "vertical-tabs"
          "PersonalToolbar"
          "TabsToolbar"
          "toolbar-menubar"
        ];
        "currentVersion" = 21;
        "newElementCount" = 3;
      };
      "browser.urlbar.placeholderName" = "Kagi";
      "browser.urlbar.quicksuggest.migrationVersion" = 2;
      "browser.urlbar.quicksuggest.scenario" = "history";
      "browser.bookmarks.autoExportHTML" = true;
    };
  };
}
