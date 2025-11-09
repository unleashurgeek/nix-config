{lib, config, ...}: {
  hosts.nixos.iso.module = {
    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

    isoImage = {
      makeEfiBootable = true;
      makeUsbBootable = true;
      squashfsCompression = "zstd -Xcompression-level 3";
    };

    imports = with config.flake.modules.nixos; [
      core
    ];
  };
}