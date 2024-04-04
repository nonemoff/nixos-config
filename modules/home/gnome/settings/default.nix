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
      "org/gnome/mutter" = {
        dynamic-workspaces = true;
        edge-tiling = true;
      };
      "org/gnome/desktop/interface" = {
        enable-hot-corners = false;
      };
    };
  };
}
