# UdonTur's NixOS Configuration File (Gnome 47) (please wait for hyprland)
# Website: www.hadrianlau.com
# GitHub: github.com/udontur
# NixOS manual: https://nixos.org/manual/nixos/stable/

{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Install firefox.
  programs.firefox.enable = true;

  # Hyprland LETS GOOOOO
  programs.hyprland = {
    enable = true;
    nvidiaPatches = true; # Disable for AMD GPU
    xwayland.enable = true;
  };

  environment.sessionVariables = {
    # Invisible cursor patch
    WLR_NO_HARDWARE_CURSORS = "1";
    # Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
  }; 

  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true; # Disable for AMD GPU
  }; 

  # Search package: $ nix search <PACKAGE NAME> or https://search.nixos.org/packages?channel=24.11&size=50&sort=relevance&type=packages&
  # Make sure to check the options: https://search.nixos.org/options?channel=24.11&size=50&sort=relevance&type=packages
  environment.systemPackages = with pkgs; [
    neofetch
    kitty
    vscode
    nixfmt-rfc-style
    firefox
    git
    hyprland
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  #programs.mtr.enable = true;
  #programs.gnupg.agent = {
  #  enable = true;
  #  enableSSHSupport = true;
  #};

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  #services.openssh.enable = true;

  # Open ports in the firewall.
  #networking.firewall.allowedTCPPorts = [ ... ];
  #networking.firewall.allowedUDPPorts = [ ... ];
  
  # Or disable the firewall altogether.
  #networking.firewall.enable = false;
  
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "laptop-nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Hong_Kong";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_HK.UTF-8";

  # Enable the X11 windowing system.
  #services.xserver.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  # Enable touchpad support (enabled default in most desktopManager).
  #services.xserver.libinput.enable = true;
  users.users.udontur = {
    isNormalUser = true;
    description = "Hadrian";
    # Don't forget to set a password with ‘passwd’.
    #passwd = "";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.11";
  services.printing.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

}
