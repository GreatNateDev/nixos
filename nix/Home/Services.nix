{...}: {
  services.wpaperd = {
    enable = true;
    settings = {
      eDP-1 = {
        path = "/home/nate/.config/nixos/data/bg/";
        duration = "20s";
      };
      HDMI-A-1 = {
        path = "/home/nate/.config/nixos/data/bg/";
        duration = "20s";
      };
    };
  };
}