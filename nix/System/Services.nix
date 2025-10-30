{ config, ... }:
let
actualUser = builtins.getEnv "SUDO_USER";
user = if actualUser != "" then actualUser else builtins.getEnv "USER";
env = import /home/${user}/.config/nixos/nix/env.nix;
in
{
  hardware.bluetooth.enable = true;
  services = {
    pulseaudio.enable = false;
    gnome.gnome-keyring.enable = true;
    displayManager = {
      sddm = {
        enable = true;
        theme = "catppuccin-moha-red";
      };
      defaultSession = "hyprland";
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
