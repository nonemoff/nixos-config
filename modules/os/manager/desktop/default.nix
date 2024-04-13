{ lib, ... }: {
  imports = [
    ./gnome
    ./hyprland
  ];

  module.manager.desktop.gnome.enable = lib.mkDefault true;
  module.manager.desktop.hyprland.enable = lib.mkDefault false;
}
