{ lib, ... }: {
  imports = [
    ./themes/gruvbox
    ./themes/adad
    ./cursors/numix
  ];

  module.gtk.theme.gruvbox.enable = lib.mkDefault false;
  module.gtk.cursor.numix.enable = lib.mkDefault false;
}
