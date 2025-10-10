{ ... }:
{
  home.username = "nate"; # output of whoami
  home.homeDirectory = "/home/nate"; # Same as $HOME
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
    ];
}
