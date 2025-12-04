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
  options.vpn.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable ProtonVPN supportt.";
  };

  config = lib.mkIf config.vpn.enable {
    home-manager.users.${username}.vpn.enable = true;
  };
}
