{ ... }: {
  services.displayManager.gdm.enable = true;
  programs.niri = {
    enable = true;
  };
}
