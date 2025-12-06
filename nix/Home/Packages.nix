{ pkgs, ... }:
{
  home.packages = with pkgs; [
    supersonic
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
    nerd-fonts.jetbrains-mono
  ];
}
