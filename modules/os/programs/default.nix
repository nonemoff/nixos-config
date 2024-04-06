{ lib, ... }: {
  imports = [
    ./virtualbox
    ./podman
  ];

  module.program.virtualbox.enable = lib.mkDefault false;
  module.program.podman.enable = lib.mkDefault false;
}
