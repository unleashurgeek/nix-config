{
  flake.modules.nixos.facter = {
    pkgs,
    inputs,
    ...
  }: {
    imports = [inputs.nixos-facter-modules.nixosModules.facter];
    environment.systemPackages = [pkgs.nixos-facter];
  };
}
