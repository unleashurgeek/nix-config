{lib, config, ...}:
let cfg = config.myModule.test; in {
  config = {
    flake.modules.nixos.other.thing = {...}: {
      services.openssh = {
        enable = true;
        settings = {
          PermitRootLogin = "no";
          PasswordAuthentication = false;
          # agent forwarding management
          # remove stale sockets
          StreamLocalBindUnlink = "yes";
          # Allow forwarding ports to everywhere
          GatewayPorts = "clientspecified";
        };
      };
    };
  };
}
