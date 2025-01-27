{ config, pkgs, ... }:
environment.systemPackages = [
    pkgs.papermcServers.papermc-1_21_1
  ];