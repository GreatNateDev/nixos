{ ... }:
let
  actualUser = builtins.getEnv "SUDO_USER";
  user = if actualUser != "" then actualUser else builtins.getEnv "USER";
  env = import /home/${user}/.config/nixos/nix/env.nix;
in
{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = [ "librewolf.desktop" ];
      "x-scheme-handler/http" = [ "librewolf.desktop" ];
      "x-scheme-handler/https" = [ "librewolf.desktop" ];
      "x-scheme-handler/about" = [ "librewolf.desktop" ];
      "x-scheme-handler/unknown" = [ "librewolf.desktop" ];
    };
  };
  xdg.userDirs.createDirectories = false;
  xdg.userDirs = {
    desktop = /home/${env.username};
    download = /home/${env.username};
    templates = /home/${env.username};
    publicShare = /home/${env.username};
    documents = /home/${env.username};
    music = /home/${env.username};
    pictures = /home/${env.username};
    videos = /home/${env.username};
  };
  xdg.desktopEntries = {
    jelly = {
      name = "Jelly";
      exec = "librewolf http://localhost:8096";
      icon = "jellyfin";
      categories = [ "AudioVideo" ];
    };
    yazi = {
      name = "yazi";
      exec = "alacritty -e yazi";
      noDisplay = true;
      categories = [ "Utility" ];
    };
    chromium-browser = {
      name = "Chromium";
      exec = "chromium";
      noDisplay = true;
      categories = [ "Network" ];
    };
    nixos-manual = {
      name = "Nixos Manual";
      exec = "nixos-help";
      noDisplay = true;
      categories = [ "System" ];
    };
    htop = {
      name = "htop";
      exec = "alacritty -e htop";
      noDisplay = true;
      categories = [ "System" ];
    };
    Alacritty = {
      name = "alacritty";
      exec = "alacritty";
      noDisplay = true;
      categories = [ "System" ];
    };
    nm-connection-editor = {
      name = "Network";
      noDisplay = true;
      icon = "cs-network";
      exec = "nm-connection-editor";
      categories = [ "Settings" ];
    };
    virt-manager = {
      name = "Virtual";
      icon = "virt-manager";
      exec = "virt-manager";
      categories = [ "System" ];
    };
    supersonic = {
      name = "Music";
      icon = "juk";
      exec = "supersonic";
      categories = [ "AudioVideo" ];
    };
    "librewolf" = {
      name = "Browser";
      icon = "librewolf";
      exec = "librewolf";
      categories = [ "Network" ];
    };
    "dev.zed.Zed" = {
      name = "Editor";
      icon = "zed";
      exec = "zeditor";
      categories = [ "Development" ];
    };
    "com.obsproject.Studio" = {
      name = "Record";
      icon = "obs";
      exec = "obs";
      categories = [ "AudioVideo" ];
    };
    "org.gnome.clocks" = {
      name = "Time";
      icon = "preferences-system-time";
      exec = "gnome-clocks";
      categories = [ "Utility" ];
    };
    "LocalSend" = {
      name = "AirDrop";
      icon = "localsend";
      exec = "localsend_app";
      categories = [ "Network" ];
    };
    "mpv" = {
      name = "Player";
      noDisplay = true;
      icon = "mpv";
      exec = "mpv";
      categories = [ "AudioVideo" ];
    };
    "org.pulseaudio.pavucontrol" = {
      name = "Audio";
      icon = "yast-sound";
      exec = "pavucontrol";
      categories = [ "AudioVideo" ];
    };
  };
}
