{ lib, ... }: {
  imports = [
    ./git
    ./alacritty
    ./zsh

    ./themes/gruvbox-gtk

    ./gnome/extensions/dash-to-dock
    ./gnome/extensions/clipboard-indicator
  ];

  module.git.enable = lib.mkDefault true;
  module.alacritty.enable = lib.mkDefault true;
  module.zsh.enable = lib.mkDefault true;

  # Themes
  module.theme.gruvbox-gtk.enable = lib.mkDefault false;

  # Gnome extensions
  module.gnome.extension.dash-to-dock.enable = lib.mkDefault true;
  module.gnome.extension.clipboard-indicator.enable = lib.mkDefault true;
}
