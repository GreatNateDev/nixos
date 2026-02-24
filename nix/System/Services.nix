{ lib, config, ... }:
let
  actualUser = builtins.getEnv "SUDO_USER";
  user = if actualUser != "" then actualUser else builtins.getEnv "USER";
  env = import /home/${user}/.config/nixos/nix/env.nix;
in
{
  hardware.bluetooth = lib.mkIf config.windowmanager.enable {
    enable = true;
  };
  services = {
    caddy = {
      enable = true;
      virtualHosts = {
        "http://jelly".extraConfig = ''
          reverse_proxy http://${env.server}:8096
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
        "http://disc".extraConfig = ''
          redir https://discord.com/login permanent
        '';
        "http://yt".extraConfig = ''
          redir https://youtube.com permanent
        '';
        "http://mail".extraConfig = ''
          redir https://account.proton.me/mail permanent
        '';
        "http://gm".extraConfig = ''
          redir https://gmail.com permanent
        '';
        "http://server".extraConfig = ''
          reverse_proxy http://${env.server}
        '';
        "http://tr".extraConfig = ''
          redir https://translate.google.com/?sl=ja&tl=en permanent
        '';
        "http://rss".extraConfig = ''
          reverse_proxy http://${env.server}:8082
        '';
      };
    };
    pulseaudio = lib.mkIf config.windowmanager.enable { enable = false; };
    gnome.gnome-keyring = lib.mkIf config.windowmanager.enable { enable = true; };
    displayManager = lib.mkIf config.windowmanager.enable {
      sddm = {
        enable = true;
        wayland.enable = true;
        theme = "catppuccin-mocha-red";
      };
      defaultSession = "hyprland";
    };
    pipewire = lib.mkIf config.windowmanager.enable {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}
