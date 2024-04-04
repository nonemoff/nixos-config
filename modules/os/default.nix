{ lib, ... }: {
  imports = [
    ./services

    ./manager/display
    ./manager/desktop
  ];
}
