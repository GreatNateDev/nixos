{ pkgs, pkgs-stable, ... }:
{
  home.packages = with pkgs; [
    #Audio & Video
    pavucontrol
    mpv
    obs-studio
    supersonic


    #Emulators and Games

    #Network
    localsend
    ungoogled-chromium
    opensnitch-ui
    #CLI
    hyprshot
    alacritty

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
    quickshell
    kdePackages.qtdeclarative
    #Other
    gnome-clocks
    networkmanagerapplet
    protonvpn-gui
    virt-manager
    nautilus
  ];
}
