{config, pkgs, ... }: 
{
  home.file."~/.config/hypr/hypr/system.conf".text = ''

# Launch
exec-once = hyprpaper
exec-once = swayosd-server
exec-once = chromium
exec-once = swaync
exec-once = nohup easyeffects --gapplication-service
exec-once = hyprctl setcursor Bibata-Modern-Ice 25
exec-once = systemctl --user start hyprpolkitagent

# Environment Variables
env = XCURSOR_THEME, Bibata-Modern-Ice
env = XCURSOR_SIZE, 25
env = HYPRCURSOR_THEME, Bibata-Modern-Ice
env = HYPRCURSOR_SIZE, 25
env = GTK_THEME, Adwaita-dark
env = ELECTRON_OZONE_PLATFORM_HINT , auto
env = QT_QPA_PLATFORM,wayland
env = QT_QPA_PLATFORMTHEME,qt5ct

# Monitors
monitor=eDP-1, 1920x1200@60, 0x0, 1.25
monitor=HDMI-A-1, 2560x1440@144, 1536x0, 1.25

# Window Rule
windowrulev2 = size 1300 750, title:btop
windowrulev2 = float, title:btop
windowrulev2 = suppressevent maximize, class:.*
windowrulev2 = nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0
windowrulev2 = rounding 16, floating:1

layerrule = noanim, hyprpicker

layerrule = noanim, selection 

workspace = w[tv1], gapsout:0, gapsin:0
workspace = f[1], gapsout:0, gapsin:0
#windowrulev2 = bordersize 0, floating:0, onworkspace:w[tv1]
#windowrulev2 = rounding 0, floating:0, onworkspace:w[tv1]
windowrulev2 = bordersize 0, floating:0, onworkspace:f[1]
windowrulev2 = rounding 0, floating:0, onworkspace:f[1]

  '';
}

