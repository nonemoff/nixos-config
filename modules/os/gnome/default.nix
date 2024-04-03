{ pkgs, lib, config, ... }: {
  options = {
    module.gnome.enable =
      lib.mkEnableOption "enables gnome";
  };

  config = lib.mkIf config.module.gnome.enable {
    nixpkgs.overlays = [
      (final: prev: {
        gnome = prev.gnome.overrideScope (gnomeFinal: gnomePrev: {
          mutter = gnomePrev.mutter.overrideAttrs (old: {
            src = pkgs.fetchgit {
              url = "https://gitlab.gnome.org/vanvugt/mutter.git";
              # GNOME 45: triple-buffering-v4-45
              rev = "0b896518b2028d9c4d6ea44806d093fd33793689";
              sha256 = "sha256-mzNy5GPlB2qkI2KEAErJQzO//uo8yO0kPQUwvGDwR4w=";
            };
          });
        });
      })
    ];

    services.xserver = {
      enable = true;
      desktopManager = {
        xterm.enable = false;
        gnome = {
          enable = true;
        };
      };
    };

    xdg = {
      portal = {
        enable = true;
      };
    };

    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };

    environment.systemPackages = [
      pkgs.gnomeExtensions.appindicator
      pkgs.gnome3.gnome-tweaks
      pkgs.wl-clipboard
    ];

    services.udev.packages = [
      pkgs.gnome.gnome-settings-daemon
    ];
  };
}
