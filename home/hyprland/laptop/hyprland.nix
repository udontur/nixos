{ inputs, pkgs, config, ... }:
{
  home.packages = with pkgs; [
    hyprpaper
    hyprcursor
    # hyprshot my own flake
    hyprlock    
    hyprnome
    
    hyprpicker
    brightnessctl
    wl-clipboard
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland; 
    extraConfig = ''
      source = ~/.config/hypr/modules/keybinds.conf
      source = ~/.config/hypr/modules/hyprwm.conf
      source = ~/.config/hypr/modules/system.conf
      source = ~/.config/hypr/modules/others.conf
    '';
  };
}
