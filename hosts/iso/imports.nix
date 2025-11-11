{config, inputs, ...}: {
  hosts.nixos.iso.modules = with config.flake.modules.nixos; [
    "${inputs.nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
  ];

  hosts.nixos.iso.users = {
    kyle.modules = with config.flake.modules.homeManager; [
      # TODO
    ];
  };
}