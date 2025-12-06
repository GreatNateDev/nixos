{ ... }:
{
  hardware.bluetooth.enable = true;
  services = {
    pulseaudio.enable = false;
    gnome.gnome-keyring.enable = true;
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
        theme = "catppuccin-mocha-red";
      };
      defaultSession = "hyprland";
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}
