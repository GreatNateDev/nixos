{ pkgs, pkgs-stable, ... }:
{
  home.packages = with pkgs; [
    pavucontrol
    mpv
    supersonic
    localsend
    ungoogled-chromium
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
    nautilus
  ];
}
