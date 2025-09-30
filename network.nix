{ ... }: {
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  virtualisation.docker.enable = true;
  networking.firewall.enable = false;
}