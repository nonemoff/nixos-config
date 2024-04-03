{ pkgs, config, lib, ... }: {
  options = {
    module.gnome.extension.clipboard-indicator.enable =
      lib.mkEnableOption "enables clipboard-indicator gnome extension";
  };

  config = lib.mkIf config.module.gnome.extension.clipboard-indicator.enable {
    home.packages = [
      pkgs.gnomeExtensions.clipboard-indicator
    ];
    dconf.settings = {
      "org/gnome/shell/extensions/clipboard-indicator" = {
        #clear-history=""@as []
        #next-entry=@as []
        #prev-entry=@as []
        toggle-menu = [ "<Super> v" ];
      };
    };
  };
}
