{inputs, ...}: {
  flake.modules.homeManager.desktop-dms = {
    stylix = {
      enable = true;
      autoEnable = false;
      polarity = "dark";

      base16Scheme = "${inputs.self}/modules/desktop/environment/dms/colors.yaml";
    };
  };
}
