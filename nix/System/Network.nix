{ lib, config, ... }:

let
  actualUser = builtins.getEnv "SUDO_USER";
  user = if actualUser != "" then actualUser else builtins.getEnv "USER";
  env = import /home/${user}/.config/nixos/nix/env.nix;
  hasStaticIp = env.address != "";
in
{
  networking = {
    networkmanager.enable = true;
    firewall.enable = true;
    useDHCP = false;
    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
    ];
    hosts = {
      "127.0.0.1" = [
        "jelly"
        "notify"
        "notes"
        "gpt"
        "fmhy"
        "git"
        "osu"
        "q"
        "yt"
        "disc"
	"server"
      ];
    };
    networkmanager.ensureProfiles.profiles = lib.mkIf config.managenet.enable {
      "main-ethernet" = {
        connection = {
          id = "main-ethernet";
          type = "ethernet";
          interface-name = "${env.ethinterface}";
          autoconnect = "true";
          autoconnect-priority = "10";
        };
        ipv4 =
          if hasStaticIp then
            {
              method = "manual";
              address1 = "${env.address}/24";
              gateway = "${env.gateway}";
              dns = "1.1.1.1;1.0.0.1;";
            }
          else
            {
              method = "auto";
              dns = "1.1.1.1;1.0.0.1;";
            };
        ipv6 = {
          method = "ignore";
        };
      };
      "main-wifi" = {
        connection = {
          id = "main-wifi";
          type = "wifi";
          autoconnect = "true";
          autoconnect-priority = "20";
        };
        wifi = {
          ssid = env.ssid;
          mode = "infrastructure";
        };
        wifi-security = {
          key-mgmt = "wpa-psk";
          psk = env.netkey;
        };
        ipv4 =
          if hasStaticIp then
            {
              method = "manual";
              address1 = "${env.address}/24";
              gateway = "${env.gateway}";
              dns = "1.1.1.1;1.0.0.1;";
            }
          else
            {
              method = "auto";
              dns = "1.1.1.1;1.0.0.1;";
            };
        ipv6 = {
          method = "ignore";
        };
      };
    };
  };
}
