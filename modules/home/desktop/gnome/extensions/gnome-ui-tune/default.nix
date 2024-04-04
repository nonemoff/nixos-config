{ pkgs, config, lib, ... }: {
  options = {
    module.desktop.gnome.extension.gnome-ui-tune.enable =
      lib.mkEnableOption "enables gnome-40-ui-improvements gnome extension";
  };

  config = lib.mkIf config.module.desktop.gnome.extension.gnome-ui-tune.enable {
    home.packages = [
      pkgs.gnomeExtensions.gnome-40-ui-improvements
    ];
    dconf.settings = {
      "org/gnome/shell/extensions/gnome-ui-tune" = {
        always-show-thumbnails = false;
        increase-thumbnails-size = "100%";
        overview-firefox-pip = true;
      };
    };
  };
}
