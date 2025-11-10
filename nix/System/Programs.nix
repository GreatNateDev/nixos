{ ... }:
{
  programs.steam.enable = true;
  programs.nix-ld.enable = true;
  programs.hyprland.enable = true;
  programs.light.enable = true;
  programs.zsh.enable = true;
  programs.wireshark = {
    enable = true;
    dumpcap.enable = true;
    usbmon.enable = true;
  };
}
