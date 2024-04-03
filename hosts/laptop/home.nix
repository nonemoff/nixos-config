{ config, pkgs, ... }:
let
  username = "nejern";
in
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = username;
  home.homeDirectory = "/home/${username}";

  # Modules
  module.git.enable = true;
  module.alacritty.enable = true;
  module.zsh.enable = true;
  module.theme.gruvbox-gtk.enable = true;

  home.packages = with pkgs; [
    # EDITOR
    neovim
    ## Etc
    ctags
    ripgrep

    # Compiler
    clang
    rustup

    # ls
    eza

    # Browser
    firefox-devedition

    # Misc
    vesktop
    telegram-desktop
    xdg-terminal-exec
    spotify

    # Fonts
    #(pkgs.nerdfonts.override { fonts = [ "MesloLGSNerdFont" ]; })
    nerdfonts

    (pkgs.writeShellScriptBin "shell-colors" ''
      #!/usr/bin/env sh
      printf "|039| \033[39mDefault \033[m  |049| \033[49mDefault \033[m  |037| \033[37mLight gray \033[m     |047| \033[47mLight gray \033[m\n"
      printf "|030| \033[30mBlack \033[m    |040| \033[40mBlack \033[m    |090| \033[90mDark gray \033[m      |100| \033[100mDark gray \033[m\n"
      printf "|031| \033[31mRed \033[m      |041| \033[41mRed \033[m      |091| \033[91mLight red \033[m      |101| \033[101mLight red \033[m\n"
      printf "|032| \033[32mGreen \033[m    |042| \033[42mGreen \033[m    |092| \033[92mLight green \033[m    |102| \033[102mLight green \033[m\n"
      printf "|033| \033[33mYellow \033[m   |043| \033[43mYellow \033[m   |093| \033[93mLight yellow \033[m   |103| \033[103mLight yellow \033[m\n"
      printf "|034| \033[34mBlue \033[m     |044| \033[44mBlue \033[m     |094| \033[94mLight blue \033[m     |104| \033[104mLight blue \033[m\n"
      printf "|035| \033[35mMagenta \033[m  |045| \033[45mMagenta \033[m  |095| \033[95mLight magenta \033[m  |105| \033[105mLight magenta \033[m\n"
      printf "|036| \033[36mCyan \033[m     |046| \033[46mCyan \033[m     |096| \033[96mLight cyan \033[m     |106| \033[106mLight cyan \033[m\n"
    '')
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Gnome custom-keybindings
  dconf.settings."org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
    binding = "<Super>x";
    command = "xdg-terminal-exec";
    name = "Open Terminal";
  };
  dconf.settings."org/gnome/settings-daemon/plugins/media-keys" = {
    custom-keybindings = [
      "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
    ];
  };

  ###
  # Shell
  ###
  home.shellAliases = {
    v = "$EDITOR";

    # ls
    ls = "eza --color=auto";
    l = "eza -la";
    la = "eza -la";
    ll = "eza -l";
    lsa = "eza -la";

    # mkdir
    md = "mkdir -p";
  };

  ###
  # Home-manager
  ###
  programs.home-manager.enable = true;
  home.stateVersion = "23.11"; # Please read the comment before changing.
}
