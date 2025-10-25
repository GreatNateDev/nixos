{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    cruise
    protonvpn-gui
    cargo
    ltrace
    lolcat
    gdb
    rustfmt
    cyme
    emulsion
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
    go
    polkit_gnome
    util-linux
    lutris
    libnotify
    mako
    gnome-clocks
    calcurse
    jaq
    (catppuccin-sddm.override {
      flavor = "mocha";
      accent = "red";
      font = "Noto Sans";
      fontSize = "9";
      #background = ./data/bg/Magna-Mountain-Wallpaper-Without-Plasma-Logo.png;
      loginBackground = false;
    })
  ];
}
