{ config, pkgs, ... }:

{
  imports = [
    ./global.nix

    ./apps/easyeffects/easyeffects.nix
    ./apps/waybar/workstation.nix

    # Hyprland
    ./hyprland/spec/workstation.nix
  ];

  # The forbidden corner
  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
  home.username = "udontur";
  home.homeDirectory = "/home/udontur";
}
