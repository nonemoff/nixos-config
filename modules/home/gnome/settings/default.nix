{ config, lib, ... }: {
  options = {
    module.gnome.settings.enable =
      lib.mkEnableOption "enables gnome settings";
  };

  config = lib.mkIf config.module.gnome.settings.enable {
    dconf.settings = {
      "org/gnome/desktop/wm/preferences" = {
        auto-raise = false;
        focus-mode = "sloppy";
        resize-with-right-button = false;
      };
    };
  };
}
