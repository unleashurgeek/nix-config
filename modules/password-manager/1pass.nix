{
  flake.modules.nixos.password-manager = {
    lib,
    hostConfig,
    ...
  }: {
    programs._1password.enable = true;

    # TODO: enable gui if desktop enabled?

    preservation.preserveAt."/persist".users =
      lib.mapAttrs (_: _: {
        directories = [
          {
            directory = ".config/op";
            mode = "0700";
          }
        ];
      })
      hostConfig.users;
  };
}
