{ lib, ... }: {
  imports = [
    ./lightdm
    ./gdm
  ];

  module.manager.display.lightdm.enable = lib.mkDefault false;
  module.manager.display.gdm.enable = lib.mkDefault false;
}
