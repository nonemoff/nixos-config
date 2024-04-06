{ inputs, pkgs, username, hostname, ... }: {
  imports = [
    ./hardware-configuration.nix
  ];

  # Modules
  module = {
    program = {
      virtualbox.enable = true;
      podman.enable = true;
    };
    service = {
      audio.enable = true;
      tlp.enable = true;
    };
    manager = {
      display.gdm.enable = true;
      desktop.gnome.enable = true;
    };
  };

  # Nix
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  # User
  users.users.${username} = {
    isNormalUser = true;
    description = username;
    extraGroups = [ "networkmanager" "wheel" "vboxusers" ];
    shell = pkgs.zsh;
  };

  # Shell
  programs.zsh.enable = true;

  # Networking
  networking.hostName = hostname;
  networking.networkmanager.enable = true;

  # Bootloader
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };
    efi = {
      canTouchEfiVariables = true;
    };
  };
  #boot.loader.systemd-boot.enable = true;
  #boot.loader.efi.canTouchEfiVariables = true;

  # Set your time zone.
  time.timeZone = "Europe/Moscow";
  # Windows time support
  time.hardwareClockInLocalTime = true;

  # Locale
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  # System Packages
  environment.systemPackages = with pkgs; [
    home-manager
    git
    neovim
    wget
    curl
  ];

  # OpenGL
  hardware.opengl.enable = true;

  # Display/Desktop Manager
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us,ru";
      options = "caps:escape_shifted_capslock";
    };
  };

  system.stateVersion = "23.11"; # Don't touch this.
}
