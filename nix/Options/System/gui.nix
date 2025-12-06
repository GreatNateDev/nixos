{
  config,
  lib,
  ...
}:

let
  actualUser = builtins.getEnv "SUDO_USER";
  user = if actualUser != "" then actualUser else builtins.getEnv "USER";
  env = import /home/${user}/.config/nixos/nix/env.nix;
  username = env.username;
in
{
  options.gui.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "GUI Settings (mostly) applications";
  };

  config = lib.mkIf config.gui.enable {
    home-manager.users.${username}.gui.enable = true;

  };
}
