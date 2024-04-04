{ pkgs, lib, config, ... }: {
  options = {
    module.gtk.cursor.numix.enable =
      lib.mkEnableOption "enables Gruvbox theme";
  };

  config = lib.mkIf config.module.gtk.cursor.numix.enable {
    dconf.settings."org/gnome/desktop/wm/preferences".button-layout = ":minimize,maximize,close";
    gtk = {
      enable = true;
      cursorTheme = {
        name = "Numix-Cursor";
        package = pkgs.numix-cursor-theme;
      };
    };
  };
}
