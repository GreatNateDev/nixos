{
  config,
  lib,
  pkgs,
  ...
}:

let
  actualUser = builtins.getEnv "SUDO_USER";
  user = if actualUser != "" then actualUser else builtins.getEnv "USER";
  env = import /home/${user}/.config/nixos/nix/env.nix;
  username = env.username;
in
{
  options.entertainment.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable Entertainment";
  };

  config = lib.mkIf config.entertainment.enable {
    home-manager.users.${username}.entertainment.enable = true;
  };
}
