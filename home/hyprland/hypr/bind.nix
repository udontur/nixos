{config, pkgs, ... }: 
{
  home.file."~/.config/hypr/hypr/bind.conf".text = ''

# System
bind = SUPER, W, killactive,
bind = SUPER, Delete, exec, reboot
bind = SUPER_Control, P, exec, shutdown now
bind = SUPER, P, exit

# Apps
bind = SUPER, Q, exec, kitty
bind = SUPER, E, exec, nautilus
bind = SUPER, F, exec, firefox
bind = SUPER, A, exec, flatpak run app.zen_browser.zen
bind = SUPER_Shift, F, exec, chromium
bindr = SUPER, SUPER_L, exec, pkill wofi || wofi -a --normal-window --show drun --allow-images
bindl = ,switch:Lid Switch, exec, hyprlock
bind = SUPER, L, exec, hyprlock
bind = SUPER, S, exec, hyprshot -m region output -z --clipboard-only
bind = SUPER_Shift, S, exec, hyprshot -m -z region
bindr = SUPER, B, exec, pkill btop || kitty --title btop -e btop
bind = SUPER, C, exec, hyprpicker -a -f hex
bind = SUPER, V, exec, code
bind = SUPER, M, exec, gnome-music

# Windows and Workspace
bind = SUPER_Control, right, workspace, +1
bind = SUPER_Control, left, workspace, -1 
bind = SUPER_Control_SHIFT, right, movetoworkspace, +1
bind = SUPER_Control_SHIFT, left,  movetoworkspace, -1 
bind = SUPER, 1, workspace 1
bind = SUPER, 2, workspace 2
bind = SUPER, 3, workspace 3
bind = SUPER, 4, workspace 4
bind = SUPER, 5, workspace 5
bind = SUPER, left, movefocus, l
bind = SUPER, right, movefocus, r
bind = SUPER, up, movefocus, u
bind = SUPER, down, movefocus, d
bindm = SUPER, mouse:272, movewindow
bindm = SUPER, mouse:273, resizewindow
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
bind = ,XF86MonBrightnessUp, exec, swayosd-client --brightness +1
bind = ,XF86MonBrightnessDown, exec, swayosd-client --brightness -1
  '';
}

