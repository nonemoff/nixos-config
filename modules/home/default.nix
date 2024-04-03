{ lib, ... }: {
  imports = [
    ./git
    ./alacritty
    ./zsh

    ./themes/gruvbox-gtk

    ./gnome/settings
    ./gnome/keybindings
    ./gnome/extensions/dash-to-dock
    ./gnome/extensions/clipboard-indicator
    ./gnome/extensions/gnome-ui-tune
  ];

  module.git.enable = lib.mkDefault true;
  module.alacritty.enable = lib.mkDefault true;
  module.zsh.enable = lib.mkDefault true;

  # Themes
  module.theme.gruvbox-gtk.enable = lib.mkDefault false;

  # Gnome
  ## Settings
  module.gnome.settings.enable = lib.mkDefault true;
  ## Keybindings
  module.gnome.keybindings.enable = lib.mkDefault true;
  ## Extensions
  module.gnome.extension.dash-to-dock.enable = lib.mkDefault true;
  module.gnome.extension.clipboard-indicator.enable = lib.mkDefault true;
  module.gnome.extension.gnome-ui-tune.enable = lib.mkDefault true;
}
