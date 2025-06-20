{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    hyprpaper
    hyprcursor
    # hyprshot my own flake
    hyprlock    
    hyprnome

    xdg-desktop-portal-hyprland
    hyprpolkitagent
    
    hyprpicker
    brightnessctl
    wl-clipboard
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      source = ~/.config/hypr/modules/keybinds.conf
      source = ~/.config/hypr/modules/hyprwm.conf
      source = ~/.config/hypr/modules/system.conf
      source = ~/.config/hypr/modules/others.conf
    '';
  };
}
