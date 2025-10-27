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
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.plymouth = {
    enable = true;
    theme = "nixos-spinner";
    themePackages = [ nixosSpinnerTheme ];
  };

  # Enable systemd in initrd for early Plymouth
  boot.initrd.systemd.enable = true;

  boot.kernelParams = [
    "quiet"
    "splash"
    "vt.global_cursor_default=0"
  ];

  boot.consoleLogLevel = 0;
  boot.initrd.verbose = false;
}
