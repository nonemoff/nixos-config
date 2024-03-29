{ lib, ... }: {
  imports = [
    ./git
    ./alacritty
    ./zsh
    ./themes/gruvbox-gtk
  ];

  module.git.enable = lib.mkDefault true;
  module.alacritty.enable = lib.mkDefault true;
  module.zsh.enable = lib.mkDefault true;

  # Themes
  module.theme.gruvbox-gtk.enable = lib.mkDefault false;
}
