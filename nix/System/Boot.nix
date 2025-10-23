{
  config,
  pkgs,
  lib,
  ...
}:

let
  nixosSpinnerTheme = pkgs.stdenv.mkDerivation {
    name = "plymouth-nixos-spinner";
    src = ../../data/plymouth; # Directory with your theme files
    buildInputs = [ pkgs.plymouth ];
    installPhase = ''
      mkdir -p $out/share/plymouth/themes/nixos-spinner
      cp -r * $out/share/plymouth/themes/nixos-spinner/
    '';
  };
in
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.plymouth = {
    enable = true;
    theme = "nixos-spinner";
    themePackages = [ nixosSpinnerTheme ];
  };

  boot.kernelParams = [
    "quiet"
    "splash"
  ];
}
