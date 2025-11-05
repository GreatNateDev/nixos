{ ... }:
let
  actualUser = builtins.getEnv "SUDO_USER";
  user = if actualUser != "" then actualUser else builtins.getEnv "USER";
  env = import /home/${user}/.config/nixos/nix/env.nix;
in
{
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
    Ryujinx = {
      name = "Ryubing";
      noDisplay = true;
      icon = "ryujinx";
      exec = "ryujinx";
      categories = [ "Game" ];
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
    "org.azahar_emu.Azahar" = {
      name = "3DS";
      noDisplay = true;
      icon = "fceux";
      exec = "azahar";
      categories = [ "Game" ];
    };
    "io.github.Foldex.AdwSteamGtk" = {
      name = "SteamSettings";
      noDisplay = true;
      icon = "steam";
      exec = "adwaita-steam-gtk";
      categories = [ "Settings" ];
    };
    "net.kuribo64.melonDS" = {
      name = "DS";
      noDisplay = true;
      icon = "fceux";
      exec = "melonDS";
      categories = [ "Game" ];
    };
    "io.mgba.mGBA" = {
      name = "GBA";
      noDisplay = true;
      icon = "fceux";
      exec = "mgba";
      categories = [ "Game" ];
    };
    Mindustry = {
      name = "Mindustry";
      noDisplay = true;
      icon = "fceux";
      exec = "mindustry";
      categories = [ "Game" ];
    };
    "osu!" = {
      name = "Rhythm";
      icon = "osu";
      exec = "osu!";
      categories = [ "Game" ];
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
    "info.cemu.Cemu" = {
      name = "WiiU";
      noDisplay = true;
      icon = "cemu";
      exec = "Cemu";
      categories = [ "Game" ];
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
    "org.prismlauncher.PrismLauncher" = {
      name = "Minecraft";
      icon = "org.prismlauncher.PrismLauncher";
      exec = "prismlauncher";
      categories = [ "Game" ];
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
    "steam" = {
      name = "Games";
      icon = "steam";
      exec = "steam";
      categories = [ "Game" ];
    };
    "net.lutris.Lutris" = {
      name = "GamesEx";
      icon = "lutris";
      exec = "lutris";
      categories = [ "Game" ];
    };
  };
}
