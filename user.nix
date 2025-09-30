{ ... }:
{
  users.users.nate = {
    isNormalUser = true;
    description = "Nate Landis";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
  };
}
