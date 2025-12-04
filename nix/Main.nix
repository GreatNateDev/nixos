# Main.nix
{
  lib,
  inputs,
  pkgs-stable,
  nur,
  winegdk,
  ...
}:

let
  actualUser = builtins.getEnv "SUDO_USER";
  user = if actualUser != "" then actualUser else builtins.getEnv "USER";
  env = import /home/${user}/.config/nixos/nix/env.nix;
  username = env.username;
  hostname = env.hostname;
in
{
  # Primary imports — including your options module
  imports = [
    (import /home/${username}/.config/nixos/nix/hardware.nix)
    (import /home/${username}/.config/nixos/nix/custom.nix)
    /home/${username}/.config/nixos/nix/options.nix # ← This enables hello.enable, etc.
    ./Options/System/hello.nix
    ./Options/System/gaming.nix
    ./Options/System/hacking.nix
    ./Options/System/development.nix
    ./System/Locale.nix
    ./System/Packages.nix
    ./System/Programs.nix
    ./System/Boot.nix
    ./System/Network.nix
    ./System/Security.nix
    ./System/Services.nix
    ./System/User.nix
    ./System/Font.nix
  ];

  networking.hostName = hostname;

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "steam"
      "steam-unwrapped"
      "osu-lazer-bin"
    ];

  system.stateVersion = "25.11";

  # --- Home Manager ---
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = {
    inherit
      inputs
      pkgs-stable
      nur
      winegdk
      ;
  };
  home-manager.users.${username} =
    {
      config,
      pkgs,
      winegdk,
      ...
    }:
    {
      imports = [
        (import /home/${username}/.config/nixos/nix/custom-home.nix)
        ./Options/Home/hello.nix
        ./Options/Home/gaming.nix
        ./Options/Home/hacking.nix
        ./Options/Home/development.nix
        ./Home/Packages.nix
        ./Home/External.nix
        ./Home/Programs.nix
        ./Home/Theme.nix
        ./Home/XDG.nix
        ./Home/Hyprland.nix
        ./Home/Systemd.nix
      ];
      home.username = username;
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "25.11";
    };

    # Global Nix settings
    nix.extraOptions = ''
      warn-dirty = false
    '';
    nix.settings = {
      experimental-features = [ "nix-command" "flakes" ];
      substituters = [ "https://hyprland.cachix.org" ];
      trusted-substituters = [ "https://hyprland.cachix.org" ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
    };
}
