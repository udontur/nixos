{
  inputs,
  config,
  pkgs,
  libs,
  ...
}:
{
  home.file = {
    "/home/udontur/.config/easyeffects/output/bass.json" = {
      source=../../assets/easyeffects/bass.json;
    };
  };
  services.easyeffects = {
    enable = true;
    preset = "bass"; # uhh, need to manually load it???
  };
}
