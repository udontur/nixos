{ inputs, pkgs, config, ... }:
{
  home.packages = with pkgs; [
    hyprpaper
    hyprcursor
    # hyprshot my own flake
    hyprnome
    hyprpolkitagent
    brightnessctl
    wl-clipboard
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    # plugins = [
    #   inputs.Hyprspace.packages.${pkgs.system}.Hyprspace
    # ];
    package = inputs.hyprland.packages.${pkgs.system}.hyprland; 
    extraConfig = ''
      source = ~/.config/hypr/modules/keybinds.conf
      source = ~/.config/hypr/modules/hyprwm.conf
      source = ~/.config/hypr/modules/system.conf
      source = ~/.config/hypr/modules/others.conf
      source = ~/.config/hypr/modules/spec.conf
    '';
  };
}
