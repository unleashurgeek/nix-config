{
  nixConfig = {
    abort-on-warn = true;
    allow-import-from-derivation = false;
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
    systems.url = "github:nix-systems/default-linux";

    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
  };

  outputs = {flake-parts, import-tree, ...} @ inputs:
    let
      inherit (inputs.nixpkgs) lib;
      files = (import-tree.withLib lib).leafs [
        ./flake-parts
        ./modules
      ];
    in
    flake-parts.lib.mkFlake {inherit inputs;} ({...}: {
      imports = files;
    });
    
    
    
    
    # (
    #   inputs.import-tree [
    #     ./flake-parts
    #     ./hosts
    #     ./modules
    #   ]
    # );
}
