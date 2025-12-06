{ pkgs, ... }:
let
  nixosSpinnerTheme = pkgs.stdenv.mkDerivation {
    name = "plymouth-nixos-spinner";
    src = ../../data/plymouth;
    buildInputs = [ pkgs.plymouth ];
    installPhase = ''
      mkdir -p $out/share/plymouth/themes/nixos-spinner
      cp -r * $out/share/plymouth/themes/nixos-spinner/
    '';
  };
in
{
  boot = {
    consoleLogLevel = 0;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    plymouth = {
      enable = true;
      theme = "nixos-spinner";
      themePackages = [ nixosSpinnerTheme ];
    };
    initrd = {
      systemd.enable = true;
      verbose = false;
    };
    kernelParams = [
      "quiet"
      "splash"
      "vt.global_cursor_default=0"
    ];
  };
}
