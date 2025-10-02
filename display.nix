{ ... }:
{
  services.displayManager.gdm.enable = true;
  programs.niri = {
    enable = true;
  };
  environment.etc = {
    "AccountsService/users/nate".text = ''
      [User]
      Icon=/etc/AccountsService/icons/nate
    '';
    "AccountsService/icons/nate".source = /home/nate/.face;
  };

}
