{ lib, ... }:
{
  options.hosts = {
    options = lib.mkOption {
      type = lib.types.lazyAttrsOf lib.types.raw;
      default = { };
    };
  };
}
