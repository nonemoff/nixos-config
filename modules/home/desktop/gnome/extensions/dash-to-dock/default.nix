{ pkgs, config, lib, ... }: {
  options = {
    module.desktop.gnome.extension.dash-to-dock.enable =
      lib.mkEnableOption "enables dash-to-dock gnome extension";
  };

  config = lib.mkIf config.module.desktop.gnome.extension.dash-to-dock.enable {
    home.packages = [
      pkgs.gnomeExtensions.dash-to-dock
    ];
    dconf.settings = {
      "org/gnome/shell/extensions/dash-to-dock" = {
        apply-custom-theme = false;
        autohide-in-fullscreen = true;
        background-opacity = 0.80000000000000004;
        click-action = "minimize-or-overview";
        custom-theme-shrink = true;
        dance-urgent-applications = true;
        dash-max-icon-size = 32;
        disable-overview-on-startup = true;
        dock-fixed = false;
        dock-position = "BOTTOM";
        extend-height = false;
        height-fraction = 0.90000000000000002;
        icon-size-fixed = true;
        intellihide-mode = "ALL_WINDOWS";
        isolate-monitors = true;
        max-alpha = 0.80000000000000004;
        middle-click-action = "launch";
        preferred-monitor = -2;
        preferred-monitor-by-connector = "eDP-1";
        preview-size-scale = 0.29999999999999999;
        running-indicator-style = "METRO";
        scroll-action = "switch-workspace";
        shift-click-action = "minimize";
        shift-middle-click-action = "launch";
        shortcut = [ "<Control> <Alt> q" ];
        shortcut-text = "<Ctrl> <Alt> q";
        show-mounts = false;
        show-show-apps-button = false;
        show-trash = false;
        transparency-mode = "DYNAMIC";
      };
    };
  };
}
