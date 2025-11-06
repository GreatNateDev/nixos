{ ... }:
let
actualUser = builtins.getEnv "SUDO_USER";
user = if actualUser != "" then actualUser else builtins.getEnv "USER";
env = import /home/${user}/.config/nixos/nix/env.nix;
in
{
  services.wpaperd = {
    enable = true;
    settings = {
      eDP-1 = {
        path = "/home/${env.username}/.config/nixos/data/bg/";
        duration = "20s";
      };
      HDMI-A-1 = {
        path = "/home/${env.username}/.config/nixos/data/bg/";
        duration = "20s";
      };
    };
  };
}
