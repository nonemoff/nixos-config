{ pkgs, lib, config, ... }: {
  options = {
    module.theme.gruvbox-gtk.enable =
      lib.mkEnableOption "enables Gruvbox theme";
  };

  config = lib.mkIf config.module.theme.gruvbox-gtk.enable {
    gtk = {
      enable = true;
      theme = {
        name = "Gruvbox-Dark-BL";
        package = pkgs.gruvbox-gtk-theme;
      };
    };
  };
}
