{ ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  imports = [
    ./hardware-configuration.nix
    ./system-packages.nix
    ./bootloader.nix
    ./display.nix
    ./locales.nix
    ./network.nix
    ./sound.nix
    ./user.nix
  ];

  system.stateVersion = "25.05"; # Dont touch
}
