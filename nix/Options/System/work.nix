{
  config,
  lib,
  ...
}:

let
  actualUser = builtins.getEnv "SUDO_USER";
  user = if actualUser != "" then actualUser else builtins.getEnv "USER";
  env = import /home/${user}/.config/nixos/nix/env.nix;
  username = env.username;
in
{
  options.work.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Apps needed for work for me";
  };

  config = lib.mkIf config.work.enable {
    home-manager.users.${username}.work.enable = true;
  };
}
