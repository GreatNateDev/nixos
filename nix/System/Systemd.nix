{ pkgs, ... }:
{
  systemd.user.services = {
    mako = {
      description = "Wayland Notification Daemon (mako)";
      after = [ "graphical-session.target" ];
      wantedBy = [ "graphical-session.target" ];
      serviceConfig = {
        ExecStart = "${pkgs.mako}/bin/mako";
        Restart = "on-failure";
        Environment = "XDG_RUNTIME_DIR=${builtins.getEnv "XDG_RUNTIME_DIR"}";
      };
    };
    polkit-agent = {
      description = "Polkit GNOME authentication agent";
      wantedBy = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig.ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      serviceConfig.Restart = "on-failure";
    };
  };
  systemd.user.services = {
    supersonic = {
      description = "Supersonic";
      wantedBy = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        ExecStart = "${pkgs.supersonic}/bin/supersonic -start-minimized";
        Restart = "on-failure";
      };
    };

    protonvpn = {
      description = "ProtonVPN Application";
      wantedBy = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        ExecStart = "${pkgs.protonvpn-gui}/bin/protonvpn-app --start-minimized";
        Restart = "on-failure";
      };
    };
  };
}
