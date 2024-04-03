{ pkgs, config, lib, ... }: {
  options = {
    module.gnome.extension.blur-my-shell.enable =
      lib.mkEnableOption "enables blur-my-shell gnome extension";
  };

  config = lib.mkIf config.module.gnome.extension.blur-my-shell.enable {
    home.packages = [
      pkgs.gnomeExtensions.blur-my-shell
    ];
    #dconf.settings = {
    #  "org/gnome/shell/extensions/blur-my-shell" = {
    #  };
    #};
  };
}
