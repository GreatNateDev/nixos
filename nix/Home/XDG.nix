{ ... }:
let
  actualUser = builtins.getEnv "SUDO_USER";
  user = if actualUser != "" then actualUser else builtins.getEnv "USER";
  env = import /home/${user}/.config/nixos/nix/env.nix;
in
{
  xdg.desktopEntries = {
    github = {
      name = "Storage";
      exec = "chromium --app=https://github.com/";
      icon = "github-desktop";
    };
    yazi = {
      name = "yazi";
      exec = "alacritty -e yazi";
      noDisplay = true;
    };
    neovim = {
      name = "neovim";
      exec = "alacritty -e nvim";
      noDisplay = true;
    };
    xterm = {
      name = "xterm";
      exec = "xterm";
      noDisplay = true;
    };
    chromium-browser = {
      name = "Chromium";
      exec = "chromium";
      noDisplay = true;
    };
    nixos-manual = {
      name = "Nixos Manual";
      exec = "nixos-help";
      noDisplay = true;
    };
    nvim = {
      name = "nvim Wrapper";
      exec = "alacritty -e nvim";
      noDisplay = true;
    };
    htop = {
      name = "htop";
      exec = "alacritty -e htop";
      noDisplay = true;
    };
    Alacritty = {
      name = "alacritty";
      exec = "alacritty";
      noDisplay = true;
    };
    Ryujinx = {
      name = "Ryubing";
      noDisplay = true;
      icon = "ryujinx";
      exec = "ryujinx";
    };
    nm-connection-editor = {
      name = "Network";
      noDisplay = true;
      icon = "cs-network";
      exec = "nm-connection-editor";
    };
    virt-manager = {
      name = "Virtual";
      icon = "virt-manager";
      exec = "virt-manager";
    };
    supersonic = {
      name = "Music";
      icon = "juk";
      exec = "supersonic";
    };
    "org.azahar_emu.Azahar" = {
      name = "3DS";
      noDisplay = true;
      icon = "fceux";
      exec = "azahar";
    };
    "io.github.Foldex.AdwSteamGtk" = {
      name = "SteamSettings";
      noDisplay = true;
      icon = "steam";
      exec = "adwaita-steam-gtk";
    };
    "net.kuribo64.melonDS" = {
      name = "DS";
      noDisplay = true;
      icon = "fceux";
      exec = "melonDS";
    };
    "io.mgba.mGBA" = {
      name = "GBA";
      noDisplay = true;
      icon = "fceux";
      exec = "mgba";
    };
    Mindustry = {
      name = "Mindustry";
      noDisplay = true;
      icon = "fceux";
      exec = "mindustry";
    };
    "osu!" = {
      name = "Rhythm";
      icon = "osu";
      exec = "osu!";
    };
    "librewolf" = {
      name = "Browser";
      icon = "librewolf";
      exec = "librewolf";
    };
    "dev.zed.Zed" = {
      name = "Editor";
      icon = "zed";
      exec = "zeditor";
    };
    "com.obsproject.Studio" = {
      name = "Record";
      icon = "obs";
      exec = "obs";
    };
    "protonvpn-app" = {
      name = "Mask";
      icon = "protonvpn-gui";
      exec = "protonvpn-app";
    };
    "info.cemu.Cemu" = {
      name = "WiiU";
      noDisplay = true;
      icon = "cemu";
      exec = "Cemu";
    };
    "org.gnome.clocks" = {
      name = "Time";
      icon = "preferences-system-time";
      exec = "gnome-clocks";
    };
    "org.godotengine.Godot4.4" = {
      name = "GameDev";
      icon = "godot";
      exec = "godot";
    };
    "LocalSend" = {
      name = "AirDrop";
      icon = "localsend";
      exec = "localsend_app";
    };
    "mpv" = {
      name = "Player";
      noDisplay = true;
      icon = "mpv";
      exec = "mpv";
    };
    "org.prismlauncher.PrismLauncher" = {
      name = "Minecraft";
      icon = "org.prismlauncher.PrismLauncher";
      exec = "prismlauncher";
    };
    "torbrowser" = {
      name = "DarkWeb";
      icon = "torbrowser";
      exec = "tor-browser";
    };
    "org.pulseaudio.pavucontrol" = {
      name = "Audio";
      icon = "yast-sound";
      exec = "pavucontrol";
    };
    "org.wireshark.Wireshark" = {
      name = "Network";
      icon = "wireshark";
      exec = "wireshark";
    };
    "re.rizin.cutter" = {
      name = "Decompile";
      icon = "cutter";
      exec = "cutter";
    };
    "steam" = {
      name = "Games";
      icon = "steam";
      exec = "steam";
    };
    "net.lutris.Lutris" = {
      name = "GamesEx";
      icon = "lutris";
      exec = "lutris";
    };
  };
}
