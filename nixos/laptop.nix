{
  inputs,
  config,
  pkgs,
  libs,
  ...
}:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
    ./global.nix

    ./pkgs/apps/laptop.nix
    ./pkgs/code/laptop.nix
    ./env/laptop-spec.nix
  ];
}
