{
  inputs,
  config,
  pkgs,
  libs,
  ...
}:
{
  home.file = {
    "/home/udontur/.config/hypr/modules/keybinds.conf" = {
      text=''
        # System
        bind = SUPER, W, killactive,
        bind = SUPER, Delete, exec, reboot
        bind = SUPER_Control, D, exec, shutdown now

        # Apps
        bind = SUPER, Q, exec, kitty
        bind = SUPER, E, exec, nautilus
        bind = SUPER, F, exec, zen
        bind = SUPER_Shift, F, exec, firefox
        bindl = ,switch:Lid Switch, exec, hyprlock
        bind = SUPER, L, exec, hyprlock
        bind = SUPER, S, exec, hyprshot -m region -z --clipboard-only
        bind = SUPER_Shift, S, exec, hyprshot -m -z region
        bind = SUPER, V, exec, code
        bind = SUPER, U, exec, osu!
        bindr = SUPER, B, exec, pkill btop || kitty --title btop -e btop
        bind = SUPER, C, exec, chromium

        # Windows and Workspace
        bind = SUPER, O, exec, hyprnome
        bind = SUPER, I, exec, hyprnome --previous
        bind = SUPER_Control, O, exec, hyprnome --move
        bind = SUPER_Control, I, exec, hyprnome --previous --move
        bind = SUPER, left, movefocus, l
        bind = SUPER, right, movefocus, r
        bind = SUPER, up, movefocus, u
        bind = SUPER, down, movefocus, d
        bindm = SUPER, mouse:272, movewindow
        bindm = SUPER, mouse:273, resizewindow
        bind = SUPER_Control_Shift, down, resizeactive, 0 50
        bind = SUPER_Control_Shift, right, resizeactive,  50 0
        bind = SUPER_Control_Shift, up, resizeactive, 0  -50
        bind = SUPER_Control_Shift, left, resizeactive,  -50 0

        bind = SUPER_Control, down, swapwindow, l
        bind = SUPER_Control, up, swapwindow, r
        bind = SUPER, J, togglesplit,

        # Function Media
        bindel = ,XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+
        bindel = ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-
        bindel = ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        bindel = ,XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
        bindel = ,XF86MonBrightnessUp, exec, brightnessctl s 1%+
        bindel = ,XF86MonBrightnessDown, exec, brightnessctl s 1%-
      
        # SwayOSD
        bind = ,XF86AudioRaiseVolume, exec, swayosd-client --output-volume +1 --max-volume 150
        bind = ,XF86AudioLowerVolume, exec, swayosd-client --output-volume -1 --max-volume 150
        bind = ,XF86AudioMute, exec, swayosd-client --output-volume mute-toggle
        bind = ,XF86MonBrightnessUp, exec, swayosd-client --brightness +1
        bind = ,XF86MonBrightnessDown, exec, swayosd-client --brightness -1        
      '';
    };
  };
}
