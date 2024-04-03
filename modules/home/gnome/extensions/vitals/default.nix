{ pkgs, config, lib, ... }: {
  options = {
    module.gnome.extension.vitals.enable =
      lib.mkEnableOption "enables vitals gnome extension";
  };

  config = lib.mkIf config.module.gnome.extension.vitals.enable {
    home.packages = [
      pkgs.gnomeExtensions.vitals
    ];
    dconf.settings = {
      "org/gnome/shell/extensions/vitals" = {
        hide-icons = false;
        hide-zeros = false;
        hot-sensors = [ "_memory_usage_" "_system_load_1m_" "__network-rx_max__" ];
        menu-centered = true;
        position-in-panel = 2;
        show-gpu = false;
        use-higher-precision = false;
      };
    };
  };
}
