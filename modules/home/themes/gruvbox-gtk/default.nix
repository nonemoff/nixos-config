{ pkgs, lib, config, ... }: {
  options = {
    module.theme.gruvbox-gtk.enable =
      lib.mkEnableOption "enables Gruvbox theme";
  };

  config = lib.mkIf config.module.theme.gruvbox-gtk.enable {
    dconf.settings."org/gnome/desktop/wm/preferences".button-layout = ":minimize,maximize,close";
    gtk = {
      enable = true;
      theme = {
        name = "Gruvbox-Dark-BL";
        package = pkgs.gruvbox-gtk-theme;
      };
      cursorTheme = {
        name = "Numix-Cursor";
        package = pkgs.numix-cursor-theme;
      };
      gtk3.extraConfig = {
        Settings = ''
          gtk-application-prefer-dark-theme=1
        '';
      };
      gtk4.extraConfig = {
        Settings = ''
          gtk-application-prefer-dark-theme=1
        '';
      };
    };
  };
}
