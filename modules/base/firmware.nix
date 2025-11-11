{
  flake.modules.nixos.base = {
    hardware.enableRedistributableFirmware = true;

    services = {
      dbus.implementation = "broker";
      # firmware updates: `fwupdmgr update`
      fwupd.enable = true;
    };
  };
}