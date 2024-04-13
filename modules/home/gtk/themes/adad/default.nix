{ pkgs, lib, config, ... }: {
  options = {
    module.gtk.theme.adad.enable =
      lib.mkEnableOption "enables adad theme";
  };

  config = lib.mkIf config.module.gtk.theme.adad.enable {
    gtk = {
      enable = true;
      gtk3.extraConfig = {
        gtk-application-prefer-dark-theme = 1;
      };
      gtk4.extraConfig = {
        gtk-application-prefer-dark-theme = 1;
      };
    };
  };
}
