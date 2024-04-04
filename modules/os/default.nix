{ lib, ... }: {
  imports = [
    ./tlp
    ./audio
    ./gnome

    ./manager/display
  ];

  module.audio.enable = lib.mkDefault false;
  module.gnome.enable = lib.mkDefault false;
  module.tlp.enable = lib.mkDefault false;
}
