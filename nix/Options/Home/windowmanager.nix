# nix/home-modules/hello.nix
{
  config,
  lib,
  pkgs,
  ...
}:

let
  actualUser = builtins.getEnv "SUDO_USER";
  user = if actualUser != "" then actualUser else builtins.getEnv "USER";
  env = import /home/${user}/.config/nixos/nix/env.nix;
  username = env.username;

  cfg = config.windowmanager;
in
{
  options.windowmanager = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable the Hyprland Window Manager";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      supersonic
      ungoogled-chromium
      hyprshot
      alacritty
      nerd-fonts.jetbrains-mono
    ];
    home.file = {
      ".config/waybar" = {
        source = ../../../data/waybar;
        recursive = true;
      };
    };
  };
}
