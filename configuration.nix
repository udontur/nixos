# UdonTur's NixOS (Hyprland) Configuration File 
# Exact system reproduction guide: https://github.com/udontur/nixos/README.md
# NixOS manual: https://nixos.org/manual/nixos/stable/

{ inputs, config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    # inputs.home-manager.nixosModules.home-manager
  ];

  # Need to add /usr/local/bin to the path variable
  # echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bashrc
  # source ~/.bashrc
  # Search package: $ nix search <PACKAGE NAME> or https://search.nixos.org/packages?channel=24.11&size=50&sort=relevance&type=packages&
  # Make sure to check the options: https://search.nixos.org/options?channel=24.11&size=50&sort=relevance&type=packages
  environment.systemPackages = with pkgs; [
    # GUI apps
    kitty
    vscode
    firefox
    nautilus  
    wofi  
    obsidian
    chromium
    easyeffects
    steam
    dconf-editor
    nwg-look
    rhythmbox
    easytag

    # CLI apps and tools
    neofetch
    btop
    yt-dlp
    zsh

    # Utility apps and tools
    git
    gcc
    gnumake
    gtk3
    brightnessctl
    lshw
    dig
    dhcpcd
    zsh-powerlevel10k
    zsh-syntax-highlighting
    zsh-autocomplete

    # Hyprland apps and tools
    hyprlock
    hyprpaper
    swayosd
    swaynotificationcenter
    hyprpicker
    hyprnome
    hyprland
    hyprcursor
    hyprshot
    xdg-desktop-portal-hyprland
    
    # NixOS
    home-manager

    # Resource packs
    noto-fonts-cjk-sans
    bibata-cursors
    adwaita-icon-theme
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };

  environment.variables = rec {
    GSETTINGS_SCHEMA_DIR="${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}/glib-2.0/schemas";
  }; 

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    jetbrains-mono
  ];

  # Enable firefox
  programs.firefox = {
    enable = true;
    preferences = {
    "widget.use-xdg-desktop-portal.file-picker" = 1;
    "widget.use-xdg-desktop-portal.mime-handler" = 1;
    };
  };

  # https://github.com/NixOS/nixpkgs/issues/207339
  programs.dconf.enable = true;

  # Enable hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  services.xserver.excludePackages = [ pkgs.xterm ];
  # Environment variables
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1"; #Hint electron apps to use wayland
  }; 

  # OpenGL
  hardware = {
    graphics.enable = true;
  }; 
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader
	boot.loader.grub = {
    enable=true;
    useOSProber=true;
    efiSupport=true;
    device="nodev";
  };  
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.networkmanager.enable = true;
  networking.hostName = "nixos"; # Define your hostname.

  # Time and Language
  time.timeZone = "Asia/Hong_Kong";
  i18n.defaultLocale = "en_HK.UTF-8"; 

  # X11 (for SDDM)
  services.xserver.enable = true;
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # SDDM
	services.displayManager.sddm.enable=true;
  services.displayManager.sddm.wayland.enable=true;

  # Touchpad
  services.libinput.enable = true;

  # User setup
  users.users.udontur = {
    isNormalUser = true;
    description = "Hadrian";
    # Password is set in the gnome graphical interface. 
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # NixOS system configuration
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.11";

  # Printer
  services.printing.enable = true;

  # Audio
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  
  networking.firewall.enable = true;

  # MISC???
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

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

}
