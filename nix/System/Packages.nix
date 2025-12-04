{
  pkgs,
  inputs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    #Commands
    chafa
    wev

    pfetch
    playerctl
    inputs.awww.packages.${pkgs.stdenv.hostPlatform.system}.awww
    cava
    hollywood
    rustfmt
    yazi


    p7zip
    ffmpeg

    fzf

    file

    tldr
    caligula
    duf
    dust
    eza
    gitui
    cruise

    lolcat


    killall
    docker
    docker-compose
    tree

    unzip
    wget
    jq

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
