{ pkgs, lib, config, ... }: {
  options = {
    module.manager.desktop.hyprland.enable =
      lib.mkEnableOption "enables hyprland";
  };

  config = lib.mkIf config.module.manager.desktop.hyprland.enable {

    programs.hyprland.enable = true;
    xdg = {
      portal = {
        enable = true;
      };
    };
  };
}
