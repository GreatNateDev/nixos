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
  options.opensnitch.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Opensnitch packet firewall";
  };

  config = lib.mkIf config.opensnitch.enable {
    services.opensnitch.enable = true;
    home-manager.users.${username}.opensnitch.enable = true;
  };
}
