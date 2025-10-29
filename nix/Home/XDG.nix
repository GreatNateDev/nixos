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
      noDisplay = true;
    };
    neovim = {
      name = "neovim";
      noDisplay = true;
    };
    xterm = {
      name = "xterm";
      noDisplay = true;
    };
    chromium-browser = {
      name = "Chromium";
      noDisplay = true;
    };
    nixos-manual = {
      name = "Nixos Manual";
      noDisplay = true;
    };
    nvim = {
      name = "nvim Wrapper";
      noDisplay = true;
    };
    htop = {
      name = "htop";
      noDisplay = true;
    };
    Alacritty = {
      name = "alacritty";
      noDisplay = true;
    };
    Ryujinx = {
      name = "Ryubing";
      noDisplay = true;
      icon = "ryujinx";
    };
    nm-connection-editor = {
      name = "Network";
      noDisplay = true;
      icon = "cs-network";
    };
    virt-manager = {
      name = "Virtual";
      icon = "virt-manager";
    };
    supersonic = {
      name = "Music";
      icon = "juk";
    };
    "org.azahar_emu.Azahar" = {
      name = "3DS";
      noDisplay = true;
      icon = "fceux";
    };
    "io.github.Foldex.AdwSteamGtk" = {
      name = "SteamSettings";
      noDisplay = true;
      icon = "steam";
    };
    "net.kuribo64.melonDS" = {
      name = "DS";
      noDisplay = true;
      icon = "fceux";
    };
    "io.mgba.mGBA" = {
      name = "GBA";
      noDisplay = true;
      icon = "fceux";
    };
    Mindustry = {
      name = "Mindustry";
      noDisplay = true;
      icon = "fceux";
    };
    "osu!" = {
      name = "Rhythm";
      icon = "osu";
    };
    "librewolf" = {
      name = "Browser";
      icon = "librewolf";
    };
    "dev.zed.Zed" = {
      name = "Editor";
      icon = "zed";
    };
    "com.obsproject.Studio" = {
      name = "Record";
      icon = "obs";
    };
    "protonvpn-app" = {
      name = "Mask";
      icon = "protonvpn-gui";
    };
    "info.cemu.Cemu" = {
      name = "WiiU";
      noDisplay = true;
      icon = "cemu";
    };
    "org.gnome.clocks" = {
      name = "Time";
      icon = "preferences-system-time";
    };
    "org.godotengine.Godot4.4" = {
      name = "GameDev";
      icon = "godot";
    };
    "LocalSend" = {
      name = "AirDrop";
      icon = "localsend";
    };
    "mpv" = {
      name = "Player";
      noDisplay = true;
      icon = "mpv";
    };
    "org.prismlauncher.PrismLauncher" = {
      name = "Minecraft";
      icon = "org.prismlauncher.PrismLauncher";
    };
    "torbrowser" = {
      name = "DarkWeb";
      icon = "torbrowser";
    };
    "org.pulseaudio.pavucontrol" = {
      name = "Audio";
      icon = "yast-sound";
    };
    "org.wireshark.Wireshark" = {
      name = "Network";
      icon = "wireshark";
    };
    "re.rizin.cutter" = {
      name = "Decompile";
      icon = "cutter";
    };
    "steam" = {
      name = "Games";
      icon = "steam";
    };
    "net.lutris.Lutris" = {
      name = "GamesEx";
      icon = "lutris";
    };
  };
}
