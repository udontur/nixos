{config, pkgs, ... }: 
{
  home.file."~/.config/hypr/hypr/style.conf".text = ''

# https://wiki.hyprland.org/Configuring/Variables/

general { 
    gaps_in = 4
    gaps_out = 0
    border_size = 2
    col.active_border = rgb(A1E754)
    col.inactive_border = rgb(707070)
    resize_on_border = true
    allow_tearing = false
    layout = dwindle
}
decoration {
    rounding = 8
    active_opacity = 1
    inactive_opacity = 1
    blur {
        enabled = false
    }
    shadow{
        enabled = false
    }
}
animations {
    enabled = yes
    bezier = bcur, 0.76, 0, 0.24, 1
    animation = windows, 1, 6, bcur, popin 80%
    animation = layers, 1, 6, bcur, fade
    animation = fade, 1, 6, bcur
    animation = border, 1, 6, default
    animation = borderangle, 1, 6, bcur, loop
    animation = workspaces, 1, 6, bcur, slidefade 20%
}

dwindle {
    pseudotile = true
    preserve_split = true
}

master {
    new_status = master
}

misc {
    force_default_wallpaper = 0     
    disable_hyprland_logo = true
    disable_splash_rendering = true
}

input {
    kb_layout = us
    kb_options = 
    follow_mouse = 1
        sensitivity = 0
        touchpad {
        natural_scroll = true
        scroll_factor = 0.15
    }
}

gestures {
    workspace_swipe = false
}
device {
    name = syna0680:00-06cb:ce44-touchpad
    sensitivity = -0.2
}

xwayland {
  force_zero_scaling = true
}

  '';
}

