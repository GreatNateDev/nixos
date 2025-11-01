{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    candy-icons
    adwaita-qt
    adwaita-qt6
  ];

  home.file.".config/kdeglobals".text = ''
    [Icons]
    Theme=candy-icons

    [KDE]
    LookAndFeelPackage=org.kde.adwaitadark.desktop
  '';

  # Optional: Configure Qt theme
  qt = {
    enable = true;
    platformTheme.name = "adwaita";
    style.name = "adwaita-dark";
  };
}
