{ lib, ... }: {
  imports = [
    ./git
    ./alacritty
    ./zsh

    ./themes/gruvbox-gtk

    ./gnome/extensions/dash-to-dock
  ];

  module.git.enable = lib.mkDefault true;
  module.alacritty.enable = lib.mkDefault true;
  module.zsh.enable = lib.mkDefault true;

  # Themes
  module.theme.gruvbox-gtk.enable = lib.mkDefault false;

  # Gnome extensions
  module.gnome.extension.dash-to-dock.enable = lib.mkDefault true;
}
