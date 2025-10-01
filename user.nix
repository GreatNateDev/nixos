{ pkgs, ... }:
programs.zsh.enable = true;
{
  users.users.nate = {
    isNormalUser = true;
    description = "Nate Landis";
		shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" "docker" ];
  };
}
