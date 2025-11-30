{config, ...}: {
  hosts.nixos.caprica.modules = with config.flake.modules.nixos; [
    user-kyle
    zfs
    desktop
    programs
    development
    messaging
    browser
    gaming
    yubikey
  ];

  hosts.nixos.caprica.users = {
    kyle.modules = with config.flake.modules.homeManager; [
      user-kyle
      desktop
      programs
      development
      messaging
      browser
      gaming
      yubikey
    ];
  };
}
