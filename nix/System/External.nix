{ ... }:

let
  env = import ./env.nix;
in
{
  # Set profile icon
  environment.etc."AccountsService/users/${env.username}".text = ''
    [User]
    Icon=/home/${env.username}/.face
  '';
}
