# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  services.flatpak.enable = true;

  # for xremap
  hardware.uinput.enable = true;
  users.groups.uinput.members = [ "adeyahya" ];
  users.groups.input.members = [ "adeyahya" ];

  # docker
  virtualisation.docker.enable = true;
  # rootless docker
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  # caching
  nix.settings = {
    trusted-users = [ "adeyahya" ];
    substituters = [
      "https://cache.nixos.org/"
    ];

    extra-substituters = [
      "https://nix-community.cachix.org"
    ];

    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };
  # enable flake
  nix.settings.experimental-features = ["nix-command" "flakes"];
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.kernelModules = [ "amdgpu" ];

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Jakarta";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "id_ID.UTF-8";
    LC_IDENTIFICATION = "id_ID.UTF-8";
    LC_MEASUREMENT = "id_ID.UTF-8";
    LC_MONETARY = "id_ID.UTF-8";
    LC_NAME = "id_ID.UTF-8";
    LC_NUMERIC = "id_ID.UTF-8";
    LC_PAPER = "id_ID.UTF-8";
    LC_TELEPHONE = "id_ID.UTF-8";
    LC_TIME = "id_ID.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = false;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  # sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.adeyahya = {
    isNormalUser = true;
    description = "adeyahya";
    extraGroups = [ "networkmanager" "wheel" "docker" "qemu-libvirtd" "libvirtd" "kvm" ];
    packages = with pkgs; [
      android-studio
      discord
      brave
      spotify
      slack
      google-chrome
      # (pkgs.callPackage ./httpie.nix { inherit pkgs lib; } )
    ];
  };

  # gnome
  programs.dconf.enable = lib.mkDefault true;

  #Dirs
  environment.etc."xdg/user-dirs.defaults".text= ''
  DESKTOP=$HOME/Desktop
  DOWNLOAD=$HOME/Downloads
  TEMPLATES=$HOME/Templates
  PUBLICSHARE=$HOME/Public
  DOCUMENTS=$HOME/Documents
  MUSIC=$HOME/Music
  PICTURES=$HOME/Photos
  VIDEOS=$HOME/Video 
  '';

  #thunar dencies
  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
  ];
  services.gvfs.enable = true; 
  services.tumbler.enable = true;

  #Overlays
  #Waybar wlr/Workspaces
  nixpkgs.overlays = [
    (self: super: {
      waybar = super.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      });
    })
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  environment.shells = with pkgs; [ zsh ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    solaar
    appimage-run
    home-manager
    hyprpaper
    nwg-look
    brightnessctl

    dunst
    libnotify
    alacritty
    kitty
    rio
    waybar
    kvmtool
    pw-volume
    fontconfig

    libsForQt5.polkit-kde-agent # authentication dialogue for GUI apps
    libsForQt5.qt5ct
    libsForQt5.qt5.qtwayland
    libsForQt5.qtstyleplugin-kvantum
    qt6.full
    qt6.qtwayland
    networkmanagerapplet
    blueman
    wl-clipboard

    bibata-cursors
    pavucontrol

    # vpn
    networkmanager-fortisslvpn
    pritunl-client
    tailscale
    tailscale-systray
    gnome.adwaita-icon-theme 
    gnomeExtensions.appindicator 
    swaylock-effects swayidle wlogout swaybg  #Login etc..  

    wayland-protocols
    libsForQt5.qt5.qtwayland
    kanshi                                    #laptop dncies
    rofi-wayland mako rofimoji                        #Drawer + notifications
    jellyfin-ffmpeg                           #multimedia libs
    viewnior                                  #image viewr
    xfce.thunar                               #filemanager
    xfce.xfconf
    gnome.file-roller
    gnome.gnome-font-viewer
    gnome.gnome-calculator
    vlc                                       #Video player
    amberol                                   #Music player
    cava                                      #Sound Visualized
    wl-clipboard                              
    wf-recorder                               #Video recorder
    sway-contrib.grimshot                     #Screenshot
    ffmpegthumbnailer                         #thumbnailer
    playerctl                                 #play,pause..
    pamixer                                   #mixer
    brightnessctl                             #Brightness control
    ####GTK Customization####
    nordic
    papirus-icon-theme
    gtk3
    glib
    xcur2png
    rubyPackages.glib2
    libcanberra-gtk3                          #notification sound
    #########System#########
    gnome.gnome-system-monitor
    poweralertd
    dbus
    ####photoshop dencies####
    gnome.zenity
    wine64Packages.waylandFull
  ];

  services.tailscale.enable = true;

  # program definition
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  environment.sessionVariables = {
    # Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
  };

  hardware = {
    opengl.enable = true;
  };
  hardware.opengl.extraPackages = with pkgs; [
    rocm-opencl-icd
    rocm-opencl-runtime
    amdvlk
  ];
  hardware.opengl.driSupport = true;

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ 
    # pkgs.xdg-desktop-portal-gtk
    pkgs.xdg-desktop-portal-hyprland
  ];

  fonts.packages = with pkgs; [
    cascadia-code
    liberation_ttf
    font-awesome
    cantarell-fonts
    work-sans
    fira
    (nerdfonts.override { fonts = [ "Hack" "FiraCode" "JetBrainsMono" ]; })
  ];

  boot.binfmt.registrations.appimage = {
    wrapInterpreterInShell = false;
    interpreter = "${pkgs.appimage-run}/bin/appimage-run";
    recognitionType = "magic";
    offset = 0;
    mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
    magicOrExtension = ''\x7fELF....AI\x02'';
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}


