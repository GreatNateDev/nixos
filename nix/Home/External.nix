{ pkgs, ... }:
let
  actualUser = builtins.getEnv "SUDO_USER";
  user = if actualUser != "" then actualUser else builtins.getEnv "USER";
  env = import /home/${user}/.config/nixos/nix/env.nix;
in
{
  home.file.".config/waybar" = {
    source = ../../data/waybar;
    recursive = true;
  };
  home.file.".config/fastfetch/config.jsonc".source = ../../data/fastfetch/config.jsonc;

}
