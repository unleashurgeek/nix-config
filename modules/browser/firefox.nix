{
  flake.modules.homeManager.browser = {
    pkgs,
    lib,
    ...
  }: {
    home.sessionVariables = {
      BROWSER = lib.mkDefault "firefox";
    };

    programs.firefox = {
      enable = true;
      package = pkgs.firefox-bin;
      profiles.default = {
        id = 0;
      };
    };
  };

  flake.modules.nixos.browser = {
    # TODO: move to xdg with v147 (.config/mozilla/...)
    preserve.users.files = [
      ".mozilla/firefox/default/cookies.sqlite"
      ".mozilla/firefox/default/favicons.sqlite"
      ".mozilla/firefox/default/permissions.sqlite"
      ".mozilla/firefox/default/content-prefs.sqlite"
      ".mozilla/firefox/default/places.sqlite"
      ".mozilla/firefox/default/storage.sqlite"
    ];
  };
}
