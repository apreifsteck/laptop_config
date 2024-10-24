{pkgs, ...}:{
  home.file."wezterm.lua" = {
    source = ../wezterm.lua;
    target = ".config/wezterm/wezterm.lua";
  };
}
