{
  hosts.nixos.mars.module = {
    system.stateVersion = "25.05";
    home-manager.sharedModules = [{home.stateVersion = "25.05";}];
  };
}
