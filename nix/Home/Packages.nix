{ pkgs, pkgs-stable, ... }:
{
  home.packages = with pkgs; [
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
  ];
}
