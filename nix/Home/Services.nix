{ ... }:
let
  env = import ./env.nix;
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
