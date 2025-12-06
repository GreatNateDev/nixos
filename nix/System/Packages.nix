{
  pkgs,
  inputs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    inputs.awww.packages.${pkgs.stdenv.hostPlatform.system}.awww
    chafa
    wev
    pfetch
    playerctl
    cava
    yazi
    p7zip
    ffmpeg
    caligula
    duf
    dust
    eza
    lolcat
    killall
    unzip
    wget
    zsh
    adwaita-qt
    adwaita-qt6
    jetbrains-mono
    fira-code
    font-awesome
    material-design-icons
    libnotify
    mako
    xwayland-satellite
    swaylock
    fuzzel
    gnome-keyring
    polkit_gnome
    (catppuccin-sddm.override {
      flavor = "mocha";
      accent = "red";
      font = "Noto Sans";
      fontSize = "9";
      loginBackground = false;
    })
  ];
}
