{ config, pkgs, ... }:
{
    services.jellyfin = {
    enable = true;
    openFirewall = false;
    user="nate";
  };
  environment.systemPackages = [
    pkgs.jellyfin
    pkgs.jellyfin-web
    pkgs.jellyfin-ffmpeg
  ];
}