{ pkgs, lib, config, ... }: {
  options = {
    module.program.terminal.alacritty.enable =
      lib.mkEnableOption "enables alacritty";
  };

  config = lib.mkIf config.module.program.terminal.alacritty.enable {
    home.file.".config/alacritty".source = ./config;
    home.packages = [ pkgs.alacritty ];
    xdg.desktopEntries = {
      Alacritty = {
        name = "Alacritty";
        type = "Application";
        exec = "env -u WAYLAND_DISPLAY alacritty";
        icon = "Alacritty";
        terminal = false;
        categories = [ "System" "TerminalEmulator" ];

        genericName = "Terminal";
        comment = "A fast, cross-platform, OpenGL terminal emulator";
        startupNotify = true;

        actions = {
          New = {
            name = "New Terminal";
            exec = "env -u WAYLAND_DISPLAY alacritty";
          };
        };
      };
    };
  };
}
