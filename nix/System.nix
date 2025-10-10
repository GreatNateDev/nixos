{ ... }:

{
  # Flake Support
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # Modules
  imports = [
    # Hardware configuration and drivers e.g. Graphics card, Wifi chip etc.
    (import ./hardware.nix)
    # Date Time and Keyboard type.
    ./System/Locale.nix
    # System Level Packages
    ./System/Packages.nix
    # Program Configuration Options
    ./System/Programs.nix
    # Booting Settings
    ./System/Boot.nix
    # External Files 
    ./System/External.nix
    # Networking Settings
    ./System/Network.nix
    # Security Settings
    ./System/Security.nix
    # System Services
    ./System/Services.nix
    # SystemD Services
    ./System/Systemd.nix
    # User setup and Groups
    ./System/User.nix
    # Basicly docker
    ./System/Virtualisation.nix 
  ];
  # Don't change this number
  system.stateVersion = "25.05";
}
