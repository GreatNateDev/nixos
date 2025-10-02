{ config, ... }:

{
  services.displayManager = {
    sddm = {
      enable = true;
      theme = "sugar-dark";
    };
    defaultSession = "niri";
    gdm.enable = false;
  };

  services.xserver = {
    enable = true;
    xkb.layout = "us";
    desktopManager.lxqt.enable = true;
    # Dynamically use driver from hardware-configuration.nix
    videoDrivers = config.boot.initrd.kernelModules;
  };
  environment.etc."AccountsService/users/yourusername".text = ''
    [User]
    Icon=/path/to/your/icon.png
  '';

  programs.niri.enable = true;
}
