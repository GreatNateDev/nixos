{ ... }:
{
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;
  networking.nameservers = [
    "1.1.1.1"
    "1.0.0.1"
  ];
}
