{ lib, ... }: {
  imports = [
    ./gnome
    ./hypr
  ];

  module.desktop.hypr.settings.enable = lib.mkDefault true;
}
