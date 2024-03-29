{ pkgs, config, lib, ... }: {
  options = {
    module.zsh.enable =
      lib.mkEnableOption "enables zsh";
  };

  config = lib.mkIf config.module.zsh.enable {
    programs.zsh = {
      enable = true;

      # Options
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      # History
      history.size = 10000;
      history.path = "${config.xdg.dataHome}/zsh/history";

      # Plugins
      plugins = [
        {
          name = "p10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
        {
          name = "p10k-config";
          src = ./p10k-config;
          file = "p10k.zsh";
        }
      ];

      # Oh My Zsh
      oh-my-zsh = {
        enable = true;
        plugins = [
          "rust"
          "colored-man-pages"
          "vi-mode"
          "docker"
          "rust"
          "docker-compose"
        ];
      };
    };
  };
}
