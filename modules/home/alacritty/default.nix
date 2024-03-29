{ pkgs, lib, config, ... }: {
  options = {
    module.alacritty.enable =
      lib.mkEnableOption "enables alacritty";
  };

  config = lib.mkIf config.module.alacritty.enable {
    home.file.".config/alacritty".source = ./config;
    home.packages = [
      pkgs.alacritty
    ];
  };
}
