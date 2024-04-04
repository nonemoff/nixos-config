{ lib, ... }: {
  imports = [
    ./tlp
    ./audio

    ./manager/display
    ./manager/desktop
  ];

  module.audio.enable = lib.mkDefault false;
  module.tlp.enable = lib.mkDefault false;
}
