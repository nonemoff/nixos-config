{ lib, ... }: {
  imports = [
    ./gnome
  ];

  module.manager.desktop.gnome.enable = lib.mkDefault false;
}
