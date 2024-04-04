{ lib, ... }: {
  imports = [
    ./services
    ./programs

    ./manager/display
    ./manager/desktop
  ];
}
