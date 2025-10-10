{ pkgs, config, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  (import /home/nate/.config/nixos/nix/hardware.nix)
    time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
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
  services.displayManager = {
    sddm = {
      enable = true;
      theme = "catppuccin-mocha-red";
    };
    defaultSession = "niri";
    gdm.enable = false;
  };

  services.xserver = {
    enable = true;
    xkb.layout = "us";
    # desktopManager.lxqt.enable = true;
    # Dynamically use driver from hardware-configuration.nix
    windowManager.i3.enable = true;
    windowManager.i3.configFile = "/home/nate/.config/nixos/data/i3/config";
    videoDrivers = config.boot.initrd.kernelModules;
  };
  programs.niri.enable = true;
  environment.etc."AccountsService/users/nate".text = ''
    [User]
    Icon=/home/nate/.face
  '';
  systemd.user.services.mako = {
    description = "Wayland Notification Daemon (mako)";
    after = [ "graphical-session.target" ];
    wantedBy = [ "graphical-session.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.mako}/bin/mako";
      Restart = "on-failure";
      Environment = "XDG_RUNTIME_DIR=${builtins.getEnv "XDG_RUNTIME_DIR"}";
    };
  };
    # User definition
  users.users.nate = {
    isNormalUser = true;
    description = "Nate Landis";
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "networkmanager"
      "docker"
      "video"
    ];
  };
  programs.light.enable = true;
  # Enable zsh
  programs.zsh.enable = true;

  # Enable system-wide polkit
  security.polkit.enable = true;

  # Per-user GNOME Polkit authentication agent
  systemd.user.services.polkit-agent = {
    description = "Polkit GNOME authentication agent";
    wantedBy = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig.ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
    serviceConfig.Restart = "on-failure";
  };
    services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
    networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  virtualisation.docker.enable = true;
  networking.firewall.enable = false;
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = true;
    };

  };
  system.stateVersion = "25.05";
}
