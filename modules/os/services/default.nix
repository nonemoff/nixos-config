{ lib, ... }: {
  imports = [
    ./tlp
    ./audio
    ./openvpn
  ];

  module.service.audio.enable = lib.mkDefault false;
  module.service.tlp.enable = lib.mkDefault false;
  module.service.openvpn.enable = lib.mkDefault true;
}
