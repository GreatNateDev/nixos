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
  options.supersonic.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Supersonic Media Player";
  };

  config = lib.mkIf config.supersonic.enable {
    home-manager.users.${username}.supersonic.enable = true;
  };
}
