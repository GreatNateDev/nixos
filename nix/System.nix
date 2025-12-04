{ lib, ... }:
let
  actualUser = builtins.getEnv "SUDO_USER";
  user = if actualUser != "" then actualUser else builtins.getEnv "USER";
  env = import /home/${user}/.config/nixos/nix/env.nix;
in
{
  # Flake Support
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  # Modules
  imports = [
    # Hardware configuration and drivers e.g. Graphics card, Wifi chip etc.
    (import /home/${env.username}/.config/nixos/nix/hardware.nix)
    # Custom Options not Added to GitHub
    (import /home/${env.username}/.config/nixos/nix/custom.nix)
    # Options Added in options.nix
    (import /home/${env.username}/.config/nixos/nix/options.nix)
    # Date Time and Keyboard type.
    ./System/Locale.nix
    # System Level Packages
    ./System/Packages.nix
    # Program Configuration Options
    ./System/Programs.nix
    # Booting Settings
    ./System/Boot.nix
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
    # Font Settings
    ./System/Font.nix
  ];
  # Unfrees
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "steam" # Closed Source
      "steam-unwrapped" # Closed Source
      "osu-lazer-bin" # Open Code Bad license
    ];

  # Don't change this number
  system.stateVersion = "25.11";
}
