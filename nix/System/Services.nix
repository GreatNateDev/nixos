{ ... }:
let
  actualUser = builtins.getEnv "SUDO_USER";
  user = if actualUser != "" then actualUser else builtins.getEnv "USER";
  env = import /home/${user}/.config/nixos/nix/env.nix;
in
{
  hardware.bluetooth.enable = true;
  services = {
    caddy = {
      enable = true;
      virtualHosts = {
        "http://jelly".extraConfig = ''
          reverse_proxy http://${env.server}:8096
        '';
        "http://notify".extraConfig = ''
          reverse_proxy http://${env.server}:5000
        '';
        "http://notes".extraConfig = ''
          reverse_proxy http://${env.server}:5230
        '';
        "http://gpt".extraConfig = ''
          redir https://chatgpt.com permanent
        '';
        "http://fmhy".extraConfig = ''
          redir https://fmhy.xyz permanent
        '';
        "http://git".extraConfig = ''
          redir https://github.com/GreatNateDev permanent
        '';
        "http://osu".extraConfig = ''
          redir https://osu.ppy.sh permanent
        '';
        "http://q".extraConfig = ''
          redir https://chat.qwen.ai/auth permanent
        '';
      };
    };
    pulseaudio.enable = false;
    gnome.gnome-keyring.enable = true;
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
        theme = "catppuccin-mocha-red";
      };
      defaultSession = "hyprland";
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}
