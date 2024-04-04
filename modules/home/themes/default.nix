{ lib, ... }: {
  imports = [
    ./gruvbox-gtk
  ];

  module.theme.gruvbox-gtk.enable = lib.mkDefault false;
}
