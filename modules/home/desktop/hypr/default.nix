{ config, lib, pkgs, ... }: {
  options = {
    module.desktop.hypr.settings.enable =
      lib.mkEnableOption "enables hypr settings";
  };

  config = lib.mkIf config.module.desktop.hypr.settings.enable {
    home.file.".config/hypr/hyprland.conf" = {
      source = ./hyprland.conf;
    };
    home.packages = [
      pkgs.wofi
    ];
  };
}
