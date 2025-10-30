{ pkgs, ... }:
{
  systemd.user.services = {
    mako = {
      Unit = {
        Description = "Wayland Notification Daemon (mako)";
        After = [ "graphical-session.target" ];
      };
      Service = {
        ExecStart = "${pkgs.mako}/bin/mako";
        Restart = "on-failure";
      };
      Install = {
        WantedBy = [ "graphical-session.target" ];
      };
    };

    polkit-agent = {
      Unit = {
        Description = "Polkit GNOME authentication agent";
        After = [ "graphical-session.target" ];
      };
      Service = {
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
      };
      Install = {
        WantedBy = [ "graphical-session.target" ];
      };
    };

    supersonic = {
      Unit = {
        Description = "Supersonic";
        After = [ "graphical-session.target" ];
      };
      Service = {
        ExecStart = "${pkgs.supersonic}/bin/supersonic -start-minimized";
        Restart = "on-failure";
      };
      Install = {
        WantedBy = [ "graphical-session.target" ];
      };
    };

    protonvpn = {
      Unit = {
        Description = "ProtonVPN Application";
        After = [ "graphical-session.target" ];
      };
      Service = {
        ExecStart = "${pkgs.protonvpn-gui}/bin/protonvpn-app --start-minimized";
        Restart = "on-failure";
      };
      Install = {
        WantedBy = [ "graphical-session.target" ];
      };
    };

    localsend = {
      Unit = {
        Description = "LocalSend Application";
        After = [ "graphical-session.target" ];
      };
      Service = {
        ExecStart = "${pkgs.localsend}/bin/localsend_app --hidden";
        Restart = "on-failure";
      };
      Install = {
        WantedBy = [ "graphical-session.target" ];
      };
    };
  };
}
