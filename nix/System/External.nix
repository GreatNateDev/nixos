{ ... }:
{
  # Set profile icon
  environment.etc."AccountsService/users/nate".text = ''
    [User]
    Icon=/home/nate/.face
  '';
}
