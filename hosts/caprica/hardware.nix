{
  hosts.nixos.caprica.module = {inputs, ...}: {
    imports = [inputs.nixos-facter-modules.nixosModules.facter];
    facter.reportPath = ./facter.json;

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}
