{ pkgs, ... }:

{
  # User definition
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
  programs.light.enable = true;
  # Enable zsh
  programs.zsh.enable = true;

  # Enable system-wide polkit
  security.polkit.enable = true;

  # Per-user GNOME Polkit authentication agent
  systemd.user.services.polkit-agent = {
    description = "Polkit GNOME authentication agent";
    wantedBy = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig.ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
    serviceConfig.Restart = "on-failure";
  };
}
