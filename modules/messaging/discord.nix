{
  flake.modules.homeManager.messaging = {
    programs.vesktop = {
      enable = true;
    };
  };

  flake.modules.nixos.messaging = {
    preserve.users.directories = [".config/vesktop"];
  };
}
