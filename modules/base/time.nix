{
  flake.modules.nixos.base = {lib, ...}: {
    time.timeZone = lib.mkDefault "America/Los_Angeles";
  };
}