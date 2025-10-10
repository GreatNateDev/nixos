{ config, pkgs, ... }:

{

  services.displayManager = {
    sddm = {
      enable = true;
      theme = "catppuccin-mocha-red";
    };
    defaultSession = "niri";
    gdm.enable = false;
  };

  services.xserver = {
    enable = true;
    xkb.layout = "us";
    # desktopManager.lxqt.enable = true;
    # Dynamically use driver from hardware-configuration.nix
    windowManager.i3.enable = true;
    windowManager.i3.configFile = "/home/nate/.config/nixos/data/i3/config";
    videoDrivers = config.boot.initrd.kernelModules;
  };
  programs.niri.enable = true;
  environment.etc."AccountsService/users/nate".text = ''
    [User]
    Icon=/home/nate/.face
  '';
  systemd.user.services.mako = {
    description = "Wayland Notification Daemon (mako)";
    after = [ "graphical-session.target" ];
    wantedBy = [ "graphical-session.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.mako}/bin/mako";
      Restart = "on-failure";
      Environment = "XDG_RUNTIME_DIR=${builtins.getEnv "XDG_RUNTIME_DIR"}";
    };
  };
}
