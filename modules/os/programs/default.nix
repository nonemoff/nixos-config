{ lib, ... }: {
  imports = [
    ./virtualbox
  ];

  module.program.virtualbox.enable = lib.mkDefault false;
}
