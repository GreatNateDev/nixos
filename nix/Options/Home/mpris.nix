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
  template = builtins.readFile ../../data/mprisence/config.toml;
  filled = builtins.replaceStrings [ "@imgbb_api_key@" ] [ env.imgbb ] template;
  mprisenceConfig = pkgs.writeTextFile {
    name = "mprisence-config.toml";
    text = filled;
  };
  cfg = config.mpris;
in
{
  options.mpris = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "MPRIS Setup";
    };
  };

  config = lib.mkIf cfg.enable {
    wayland.windowManager.hyprland.settings.exec-once = lib.mkAfter [ "mprisence" ];
    home.file.".config/mprisence/config.toml".source = mprisenceConfig;
  };
}
