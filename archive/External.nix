{ ... }:

let
  actualUser = builtins.getEnv "SUDO_USER";
  user = if actualUser != "" then actualUser else builtins.getEnv "USER";
  env = import /home/${user}/.config/nixos/nix/env.nix;
in
{
  # Set profile icon
  environment.etc."AccountsService/users/${env.username}".text = ''
    [User]
    Icon=/home/${env.username}/.face
  '';
}
