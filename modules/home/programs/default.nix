{ lib, ... }: {
  imports = [
    ./git

    ./terminals/alacritty
    ./shells/zsh
  ];


  # Programs
  module.program.git.enable = lib.mkDefault false;

  ## Terminals
  module.program.terminal.alacritty.enable = lib.mkDefault false;

  ## Shells
  module.program.shell.zsh.enable = lib.mkDefault false;
}
