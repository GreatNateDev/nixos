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

  cfg = config.hello;
in
{
  options.hello = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable Hello World module in Home Manager.";
    };
  };

  config = lib.mkIf cfg.enable {
    home.file."hello.txt".text = ''
      Hello from Home Manager, ${username}!
      Full name: ${env.fullname}
      Git user: ${env.gituser}
      Hello module: ${if cfg.enable then "ON" else "OFF"}
    '';

    home.packages = with pkgs; [
      cowsay
      lolcat
    ];
  };
}
