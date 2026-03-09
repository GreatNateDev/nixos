{ lib, config, ... }:

let
  actualUser = builtins.getEnv "SUDO_USER";
  user = if actualUser != "" then actualUser else builtins.getEnv "USER";

  env = import /home/${user}/.config/nixos/nix/env.nix;

  hasStaticIp = env.address != "";

  ipv4Config =
    if hasStaticIp then
      {
        method = "manual";
        address1 = "${env.address}/24";
        gateway = env.gateway;

        dns = env.dns;
        ignore-auto-dns = true;
        ignore-auto-domain = true;
      }
    else
      {
        method = "auto";

        dns = env.dns;
        ignore-auto-dns = true;
        ignore-auto-domain = true;
      };

  mkProfile =
    base:
    base
    // {
      ipv4 = ipv4Config;
      ipv6.method = "ignore";
    };

in
{
  networking = {
    networkmanager.enable = true;
    firewall.enable = true;
    useDHCP = false;

    nameservers = [ env.dns ];

    hosts."127.0.0.1" = [
      "jelly"
      "gpt"
      "fmhy"
      "git"
      "osu"
      "q"
      "yt"
      "disc"
      "mail"
      "gm"
      "server"
      "rss"
      "torrent"
      "password"
      "tr"
      "code"
    ];

    networkmanager.ensureProfiles.profiles = lib.mkIf config.managenet.enable {

      main-ethernet = mkProfile {
        connection = {
          id = "main-ethernet";
          type = "ethernet";
          interface-name = env.ethinterface;

          autoconnect = true;
          autoconnect-priority = 10;
        };
      };

      main-wifi = mkProfile {
        connection = {
          id = "main-wifi";
          type = "wifi";

          autoconnect = true;
          autoconnect-priority = 20;
        };

        wifi = {
          ssid = env.ssid;
          mode = "infrastructure";
        };

        wifi-security = {
          key-mgmt = "wpa-psk";
          psk = env.netkey;
        };
      };

    };
  };
}
