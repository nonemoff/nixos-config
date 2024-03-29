{ pkgs, lib, config, ... }: {
  options = {
    module.gnome.enable =
      lib.mkEnableOption "enables gnome";
  };

  config = lib.mkIf config.module.gnome.enable {
    services.xserver = {
      enable = true;
      desktopManager = {
        gnome = {
          enable = true;
        };
      };
    };
    environment.systemPackages = [
      pkgs.gnomeExtensions.appindicator
      pkgs.gnome3.gnome-tweaks
    ];
    services.udev.packages = [
      pkgs.gnome.gnome-settings-daemon
    ];
  };
}
