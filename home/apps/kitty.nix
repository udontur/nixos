{ pkgs, config, ... }:
{
  programs.kitty = {
    enable = true;
    extraConfig = ''
      background #2c2e34
      foreground #ebebeb
      font_family Recursive Mono Casual Static
      font_size 12.0
      confirm_os_window_close 0
    '';
  };
}
