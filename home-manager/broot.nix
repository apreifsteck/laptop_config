{pkgs, ...}:{
  programs.broot = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
  };
}
