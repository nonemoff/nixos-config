{ pkgs, config, lib, ... }: {
  options = {
    module.gnome.extension.clipboard-indicator.enable =
      lib.mkEnableOption "enables dash-to-dock gnome extension";
  };

  config = lib.mkIf config.module.gnome.extension.clipboard-indicator.enable {
    home.packages = [
      pkgs.gnomeExtensions.clipboard-indicator
    ];
    dconf.settings = {
      "org/gnome/shell/extensions/dash-to-dock" = {
        #clear-history=""@as []
        #next-entry=@as []
        #prev-entry=@as []
        toggle-menu = [ "<Super> v" ];
      };
    };
  };
}
