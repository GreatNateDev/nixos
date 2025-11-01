{
  config,
  pkgs,
  lib,
  ...
}:
let
  actualUser = builtins.getEnv "SUDO_USER";
  user = if actualUser != "" then actualUser else builtins.getEnv "USER";
  env = import /home/${user}/.config/nixos/nix/env.nix;
in
{
  services.desktopManager.plasma6.enable = true;

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    aurorae
    plasma-browser-integration
    plasma-workspace-wallpapers
    konsole
    ark
    elisa
    gwenview
    okular
    kate
    khelpcenter
    dolphin
    baloo-widgets
    dolphin-plugins
    spectacle
    ffmpegthumbs
    krdp
    print-manager
    discover
  ];

  services.displayManager = {
    autoLogin = {
      enable = true;
      user = "${env.username}";
    };
    defaultSession = lib.mkForce "steam";
  };

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  # Auto-start Steam in desktop mode for virtual keyboard access
  systemd.user.services.steam-autostart = {
    description = "Steam (for virtual keyboard in desktop mode)";
    wantedBy = [ "plasma-workspace.target" ];
    partOf = [ "plasma-workspace.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.steam}/bin/steam -silent";
      Restart = "on-failure";
    };
  };
}
