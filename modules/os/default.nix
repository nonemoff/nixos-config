{ lib, ... }: {
  imports = [
    ./tlp
    ./audio
    ./gnome
  ];

  module.tlp.enable = lib.mkDefault true;
  module.audio.enable = lib.mkDefault true;
  module.gnome.enable = lib.mkDefault true;
}
