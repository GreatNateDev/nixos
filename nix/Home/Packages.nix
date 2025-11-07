{ pkgs, pkgs-stable, ... }:
{
  home.packages = with pkgs; [
    #Audio & Video
    pavucontrol
    mpv
    obs-studio
    supersonic
    yt-dlp
    id3v2
    #Emulators and Games
    lutris
    osu-lazer-bin
    prismlauncher
    adwsteamgtk
    mindustry-wayland
    pkgs-stable.azahar
    pkgs-stable.melonDS
    pkgs-stable.ryubing
    pkgs-stable.cemu
    pkgs-stable.mgba
    pkgs-stable.godot
    #Network
    localsend
    ungoogled-chromium
    tor-browser
    #CLI
    alacritty
    gh
    fastfetch
    htop
    zsh-powerlevel10k
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-completions
    zsh-history-substring-search
    zsh-fzf-tab
    #Themeing
    nerd-fonts.jetbrains-mono
    #Other
    (cutter.withPlugins (
      ps: with ps; [
        jsdec
        rz-ghidra
      ]
    ))
    gnome-clocks
    networkmanagerapplet
    protonvpn-gui
    virt-manager
    nautilus
  ];
}
