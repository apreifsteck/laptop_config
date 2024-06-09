{ pkgs, ...}: {
  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;

      plugins = [
        "colored-man-pages"
        "colorize"
      ];
    };

    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
  };
}

