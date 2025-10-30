{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    #Commands
    yazi
    radare2
    binutils
    p7zip
    unrar
    ffmpeg
    exiftool
    fzf
    httpie
    file
    macchanger
    tldr
    caligula
    duf
    dust
    eza
    gitui
    cruise
    ltrace
    lolcat
    gdb
    cyme
    killall
    docker
    docker-compose
    git
    tree
    nmap
    unzip
    wget
    jq
    util-linux
    #Programming
    zsh
    #Fonts & Themes
    adwaita-qt
    adwaita-qt6
    jetbrains-mono
    fira-code
    font-awesome
    material-design-icons
    libnotify
    mako
    (catppuccin-sddm.override {
      flavor = "mocha";
      accent = "red";
      font = "Noto Sans";
      fontSize = "9";
      #background = ./data/bg/Magna-Mountain-Wallpaper-Without-Plasma-Logo.png;
      loginBackground = false;
    })
    #Systems
    xwayland-satellite
    swaylock
    fuzzel
    gnome-keyring
    polkit_gnome
  ];
}
