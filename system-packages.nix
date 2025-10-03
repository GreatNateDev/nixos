{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
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
    gnome-keyring
    neovim
    gcc
    ripgrep
    fd
    lazygit
    lua-language-server
    tree-sitter
    unzip
    wget
    nodejs_20
    glib
    (catppuccin-sddm.override {
      flavor = "mocha";
      accent = "red";
      font = "Noto Sans";
      fontSize = "9";
      #background = ./data/bg/Magna-Mountain-Wallpaper-Without-Plasma-Logo.png;
      loginBackground = false;
    })
  ];

  services.gnome.gnome-keyring = {
    enable = true;
  };
  programs.steam = {
    enable = true;
  };
  programs.nix-ld.enable = true;
}
