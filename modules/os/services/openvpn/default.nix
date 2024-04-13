{ lib, config, ... }: {
  options = {
    module.service.openvpn.enable =
      lib.mkEnableOption "enables openvpn";
  };

  config = lib.mkIf config.module.service.openvpn.enable {
    services.openvpn.servers = {
      zlp = { config = '' config /home/matvey/Documents/openvpn/zlp.ovpn''; };
    };
  };
}
