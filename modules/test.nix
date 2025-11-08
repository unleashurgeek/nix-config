{lib, config, ...}:
let cfg = config.ohterModule; in {
  options = {
    otherModule.enable = lib.mkEnableOption "Enable Module";
  };

  config = lib.mkIf cfg.enable {
    #config contextsdfjsldkjflsdkfj
  };
}