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
  options.mpris.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Mprisence Setup";
  };

  config = lib.mkIf config.mpris.enable {
    environment.systemPackages = [ pkgs.mprisence ];
    home-manager.users.${username}.mpris.enable = true;

  };
}
