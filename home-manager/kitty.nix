{ pkgs, ...}: {
  programs.kitty = {
    enable = true;

    keybindings = {
      "ctrl+shift+e" = "next_window";
      "ctrl+shift+n" = "previous_window";
      "shift+cmd+e" = "next_tab";
      "shift+cmd+n" = "previous_tab";
    };

    settings = {
      enabled_layouts = "horizontal";
    };

    font = {
      package = pkgs.nerdfonts;
      name = "Fira Code Nerd Font";
      size = 20;
    };

    theme = "Ayu Mirage";
  };
}
