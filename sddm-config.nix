{ config, pkgs, ... }:

let
  sddm-theme = pkgs.callPackage ./sddm.nix {};
in
{
  services.xserver.enable = true;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "${sddm-theme}";
  };

  environment.systemPackages = [ sddm-theme ];
}
