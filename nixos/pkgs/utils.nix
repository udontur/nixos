{
  inputs,
  config,
  pkgs,
  libs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    # Utility
    git
    inputs.hyprshot.packages."${system}".default
    swayosd
    swaynotificationcenter
    acpi
    hyprpicker
    libnotify
    smile
    copyq
    waybar
  ];
}
