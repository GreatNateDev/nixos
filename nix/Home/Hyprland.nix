{ inputs, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;

    plugins = [
      inputs.hyprland-plugins.packages.${pkgs.system}.hyprscrolling
    ];
    settings = {
      monitor = ", preferred, auto, 1";
      plugin = [
        {
          hyprscrolling = [
            {
              bind = [
                "$mod, period, layoutmsg, move +col"
                "$mod, comma, layoutmsg, move -col"
              ];
            }
          ];
        }
      ];
      exec-once = [
        "hyprctl plugin load $HYPR_PLUGIN_DIR/lib/libhyprexpo.so"
        "waybar"
      ];
      "$mod" = "SUPER";
      bind = [
        "$mod, T, exec, alacritty"
        "$mod, D, exec, fuzzel"
        "$mod, E, exec, nautilus"
        "$mod, Z, exec, zeditor"
        "$mod, B, exec, librewolf"
        "$mod, S, exec, supersonic"
        "$mod ALT, L, exec, swaylock, -i ~/.config/nixos/data/bg/wall.jpg"
        "$mod, Q, killactive"
        "$mod CTRL, Q, forcekillactive"
        "$mod, F, fullscreenstate, 1"
        "$mod SHIFT, F, fullscreenstate, 2"
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"

      ];
      bindle = [
        ", XF86MonBrightnessUp, exec, light -A 10"
        ", XF86MonBrightnessDown, exec, light -U 10"
        "Shift, XF86MonBrightnessUp, exec, light -A 5"
        "Shift, XF86MonBrightnessDown, exec, light -U 5"
        "Ctrl, XF86MonBrightnessUp, exec, light -A 1"
        "Ctrl, XF86MonBrightnessDown, exec, light -U 1"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-"
        "Shift, XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+"
        "Shift, XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-"
        "Ctrl, XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.01+"
        "Ctrl, XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.01-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"

      ];

    };
  };
}
