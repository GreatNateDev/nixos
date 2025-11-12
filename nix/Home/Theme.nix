{ pkgs, ... }:
{
  home.pointerCursor = {
    package = pkgs.catppuccin-cursors.mochaRed;
    name = "catppuccin-mocha-red-cursors";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };
  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-mocha-red-standard";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "red" ];
        variant = "mocha";
      };
    };
    iconTheme = {
      name = "candy-icons";
      package = pkgs.candy-icons;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };
  home.sessionVariables = {
    XCURSOR_SIZE = "24";
    GTK_THEME = "catppuccin-mocha-red-standard";
    _JAVA_AWT_WM_NONREPARENTING = "1";
    QT_STYLE_OVERRIDE = "adwaita-dark";
    QML_IMPORT_PATH = "${pkgs.quickshell}/lib/qml";
    QML2_IMPORT_PATH = "${pkgs.quickshell}/lib/qml";
  };
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = "catppuccin-mocha-red-standard";
      icon-theme = "candy-icons";
      cursor-theme = "catppuccin-mocha-red-cursors";
    };
    "io/github/Foldex/AdwSteamGtk" = {
      "color-theme-options" = "Catppuccin-Mocha";
      "hide-whats-new-switch" = "false";
      "library-sidebar-options" = "Show";
      "login-qr-options" = "Show";
      "no-rounded-corners-switch" = "false";
      "prefs-beta-support" = "false";
      "window-controls-layout-options" = "Auto";
      "window-controls-options" = "Adwaita";
    };
  };
  #qt = {
  # enable = true;
  #  style.name = "adwaita-dark"; # Qt Adwaita Dark theme
  # };
}
