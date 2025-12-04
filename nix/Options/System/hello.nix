# nix/modules/hello.nix
{ config, lib, pkgs, ... }:

let
  actualUser = builtins.getEnv "SUDO_USER";
  user = if actualUser != "" then actualUser else builtins.getEnv "USER";
  env = import /home/${user}/.config/nixos/nix/env.nix;
  username = env.username;  # e.g. "nate"
in
{
  options.hello.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable Hello World module.";
  };

  config = lib.mkIf config.hello.enable {
    system.activationScripts.hello = {
      text = ''
        echo "Hello from NixOS, ${username}!" > /run/hello-system.txt
        echo "Host: ${env.hostname}" >> /run/hello-system.txt
      '';
      deps = [ ];
    };

    # Also enable the Home Manager hello module for the user
    home-manager.users.${username}.hello.enable = true;

    environment.systemPackages = lib.mkIf config.hello.enable [ pkgs.figlet ];
  };
}
