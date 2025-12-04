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
    mprisence = {
      Unit = {
        Description = "Discord Rich Presence for MPRIS media players";
        After = [ "graphical-session.target" ];
        PartOf = [ "graphical-session.target" ];
      };

      Service = {
        Type = "simple";
        ExecStart = "${pkgs.mprisence}/bin/mprisence";
        Restart = "on-failure";
        RestartSec = 5;
      };

      Install = {
        WantedBy = [ "graphical-session.target" ];
      };
    };
  };
}
