{ config, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ./jellyfin.nix
    ];
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  #Networking
  networking.hostName = "Nate-Landises-Computer";
  networking.networkmanager.enable = true;
  # Locales
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
  # Desktop ENV
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm.enable = true;
  # Printing
  services.printing.enable = true;
  # Audio
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  # Users and user packages
  users.users.nate = {
    isNormalUser = true;
    description = "Nathaniel Landis";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
  # Firefox
  programs.firefox.enable = true;
  #Main Packages
  environment.systemPackages = with pkgs; [
  jdk
  git-credential-manager
  vscode  
  git
  github-desktop
  xdg-utils
  xdg-desktop-portal
  xdg-desktop-portal-gtk
  xdg-desktop-portal-kde
  godot_4
  prismlauncher
  fastfetch
  direnv
  ];
  # Services
  services.openssh.enable = true;
  networking.firewall.enable = false;
   xdg = {
    portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-kde
      ];
    };
  };
  #Version
  system.stateVersion = "24.11";
  #Unfree :(
  nixpkgs.config.allowUnfree = true;
}
