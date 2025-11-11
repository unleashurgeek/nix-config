{
  flake.modules.nixos.base = {
    # Don't allow mutaiton of users outside configs
    users.mutableUsers = false;
  };
}