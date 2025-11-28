{inputs, ...}: {
  flake.modules.nixos.base = {
    imports = [inputs.stylix.nixosModules.stylix];
    stylix = {
      homeManagerIntegration.autoImport = true;
    };
  };

  flake.modules.homeManager.base = {
    imports = [inputs.stylix.homeModules.stylix];

    stylix = {
      autoEnable = false;
      # TODO: temporary until stylix updates to 26.05
      enableReleaseChecks = false;
    };
  };
}
