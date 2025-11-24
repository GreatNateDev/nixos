{ pkgs, ... }:
let
  actualUser = builtins.getEnv "SUDO_USER";
  user = if actualUser != "" then actualUser else builtins.getEnv "USER";
  env = import /home/${user}/.config/nixos/nix/env.nix;
  template = builtins.readFile ../../data/mprisence/config.toml;
  filled = builtins.replaceStrings [ "@imgbb_api_key@" ] [ env.imgbb ] template;
  mprisenceConfig = pkgs.writeTextFile {
    name = "mprisence-config.toml";
    text = filled;
  };
in
{
  home.file.".config/mprisence/config.toml".source = mprisenceConfig;
  home.file.".config/waybar" = {
    source = ../../data/waybar;
    recursive = true;
  };
  home.file.".config/fastfetch/config.jsonc".source = ../../data/fastfetch/config.jsonc;

}
