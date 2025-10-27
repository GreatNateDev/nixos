{ config, ... }:
let
  env = import ./env.nix;
in
{
  hardware.bluetooth.enable = true;
  services = {
    pulseaudio.enable = false;
    gnome.gnome-keyring.enable = true;
    displayManager = {
      sddm = {
        enable = true;
        theme = "catppuccin-mocha-red";
      };
      defaultSession = "niri";
      gdm.enable = false;
    };
    xserver = {
      enable = true;
      windowManager.i3.enable = true;
      windowManager.i3.configFile = "/home/${env.username}/.config/nixos/data/i3/config";
      videoDrivers = config.boot.initrd.kernelModules;
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = true;
      };
    };
  };
}
