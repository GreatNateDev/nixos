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
  options.drawing.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable Drawing Tablet";
  };

  config = lib.mkIf config.drawing.enable {
    hardware.opentabletdriver.enable = true;
    environment.etc."libinput/local-overrides.quirks".text = ''
      [Tablet Buttons]
      MatchName=*UGEE*PenTablet*
      AttrButtonMapping=3;1;2
    '';
    home-manager.users.${username}.drawing.enable = true;
  };
}
