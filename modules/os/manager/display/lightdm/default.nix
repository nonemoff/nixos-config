{ lib, config, ... }: {
  options = {
    module.manager.display.lightdm.enable =
      lib.mkEnableOption "enables lightdm display manager";
  };

  config = lib.mkIf config.module.manager.display.lightdm.enable {
    services.xserver = {
      displayManager = {
        lightdm = {
          enable = true;
        };
      };
    };
  };
}
