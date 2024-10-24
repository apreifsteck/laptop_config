{ pkgs, ...}: {
  programs.mcfly = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
  };
}
