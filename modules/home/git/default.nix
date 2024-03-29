{ lib, config, ... }: {
  options = {
    module.git.enable =
      lib.mkEnableOption "enables git";
  };

  config = lib.mkIf config.module.git.enable {
    home.file.".gitconfig".source = ./.gitconfig;
  };
}
