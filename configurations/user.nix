{lib, ...}: {
  hosts.options.primaryUser = lib.mkOption {
    type = lib.types.str;
    default = "kyle";
  };
}
