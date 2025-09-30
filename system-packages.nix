{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    catppuccin-cursors.mochaRed
    killall
    zsh
    git
    docker
    docker-compose
    direnv
    nixfmt-rfc-style
    nixd
    jetbrains-mono
    fira-code
    font-awesome
    material-design-icons
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka
    tree
    nmap
  ];
}
