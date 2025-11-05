{ ... }:
let
  actualUser = builtins.getEnv "SUDO_USER";
  user = if actualUser != "" then actualUser else builtins.getEnv "USER";
  env = import /home/${user}/.config/nixos/nix/env.nix;
in
{
  home.username = "${env.username}"; # output of whoami
  home.homeDirectory = "/home/${env.username}"; # Same as $HOME
  home.stateVersion = "25.11"; # Dont Touch
  imports = [
    #User level packages
    ./Home/Packages.nix
    # Home-Manager Activation Scripts
    ./Home/Activations.nix
    # External Config Files
    ./Home/External.nix
    # Program Settings
    ./Home/Programs.nix
    # User level Services
    ./Home/Services.nix
    # Gtk and cursor themes
    ./Home/Theme.nix
    # XDG files for fuzzel
    ./Home/XDG.nix
    # Hyprland Configuration
    ./Home/Hyprland.nix
    # Userland Systemd services
    ./Home/Systemd.nix
    # Niri Config
    ./Home/Niri.nix
  ];
}
