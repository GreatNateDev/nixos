{ ... }:
let
  env = import ./env.nix;
in
{
  networking.hostName = "${env.hostname}";
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;
  networking.nameservers = [
    "1.1.1.1"
    "1.0.0.1"
  ];
}
