{ pkgs, ... }:
{
  users.users.nate = {
    isNormalUser = true;
    description = "Nate Landis";
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "networkmanager"
      "docker"
      "video"
    ];
  };
}
