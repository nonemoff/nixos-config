{ lib, ... }: {
  imports = [
    ./tlp
    ./audio
  ];

  module.service.audio.enable = lib.mkDefault false;
  module.service.tlp.enable = lib.mkDefault false;
}
