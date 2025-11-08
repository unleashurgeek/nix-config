{
  self,
  inputs,
  config,
  ...
}: {
  flake = let
    inherit (inputs.nixpkgs) lib;
    inherit (self) outputs;
  in {
    nixosConfigurations.iso = lib.nixosSystem {
      modules = with config.flake.modules.nixos;
        [
          "${inputs.nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
        ];

      specialArgs = {inherit inputs outputs;};
    };
  };
}