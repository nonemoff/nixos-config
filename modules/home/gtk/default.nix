{ lib, ... }: {
  imports = [
    ./themes/gruvbox
    ./cursors/numix
  ];

  module.gtk.theme.gruvbox.enable = lib.mkDefault false;
  module.gtk.cursor.numix.enable = lib.mkDefault false;
}
