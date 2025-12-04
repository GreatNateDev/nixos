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
    github = {
      name = "Storage";
      exec = "chromium --app=https://github.com/";
      icon = "github-desktop";
      categories = [ "Development" ];
    };
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
    neovim = {
      name = "neovim";
      exec = "alacritty -e nvim";
      noDisplay = true;
      categories = [ "Development" ];
    };
    xterm = {
      name = "xterm";
      exec = "xterm";
      noDisplay = true;
      categories = [ "System" ];
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
    nvim = {
      name = "nvim Wrapper";
      exec = "alacritty -e nvim";
      noDisplay = true;
      categories = [ "Development" ];
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
    "protonvpn-app" = {
      name = "Mask";
      icon = "protonvpn-gui";
      exec = "protonvpn-app";
      categories = [ "Network" ];
    };

    "org.gnome.clocks" = {
      name = "Time";
      icon = "preferences-system-time";
      exec = "gnome-clocks";
      categories = [ "Utility" ];
    };
    "org.godotengine.Godot4.4" = {
      name = "GameDev";
      icon = "godot";
      exec = "godot";
      categories = [ "Development" ];
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

    "torbrowser" = {
      name = "DarkWeb";
      icon = "torbrowser";
      exec = "tor-browser";
      categories = [ "Network" ];
    };
    "org.pulseaudio.pavucontrol" = {
      name = "Audio";
      icon = "yast-sound";
      exec = "pavucontrol";
      categories = [ "AudioVideo" ];
    };
    "org.wireshark.Wireshark" = {
      name = "Network";
      icon = "wireshark";
      exec = "wireshark";
      categories = [ "Network" ];
    };
    "re.rizin.cutter" = {
      name = "Decompile";
      icon = "cutter";
      exec = "cutter";
      categories = [ "Development" ];
    };


    "winboat" = {
      name = "WinBloat";
      icon = "winboat";
      exec = "winboat %U";
      categories = [ "Utility" ];
    };
  };
}
