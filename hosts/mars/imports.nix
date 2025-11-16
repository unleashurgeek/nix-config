{config, ...}: {
  hosts.nixos.mars.modules = with config.flake.modules.nixos; [
    user-kyle
    zfs
    password-manager
  ];

  hosts.nixos.mars.users = {
    kyle.modules = with config.flake.modules.homeManager; [
      user-kyle
    ];
  };
}
