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

    shellAliases = {
      ls = "eza";
    };

    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
  };
}

