{ lib, ... }: {
  imports = [
    ./lightdm
  ];

  module.manager.display.lightdm.enable = lib.mkDefault false;
}
