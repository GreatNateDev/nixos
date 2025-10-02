{ ... }:
{
  services.displayManager = {
    sddm.enable = true;
    defaultSession = "niri";
    # Disable GDM in case it lingers
    gdm.enable = false;
  };

  # X server
  services.xserver = {
    enable = true;
    xkb.layout = "us"; # keyboard layout
    desktopManager.lxqt.enable = true;
    # Set video drivers explicitly to avoid blank screen
    # Change "intel" to "nvidia" or "amdgpu" depending on your GPU
    #videoDrivers = [ "amdgpu" ];
  };
  programs.niri = {
    enable = true;
  };

}
