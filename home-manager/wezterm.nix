{pkgs, ...}:{

  
  home.file."wezterm.lua" = {
    source = ../wezterm.lua;
    target = ".config/wezterm/wezterm.lua";
  };
  
  
  # Until this can be built on my machine...
  # programs.wezterm = {
  #   enable = true;
  #   enableZshIntegration = true;

  #   # extraConfig = ''
  #   # return {
  #   #   font_size = 16.0,
  #   #   keys = {
  #   #     {mods="SUPER", key="Enter", action=wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }},
  #   #     {mods="SUPER|SHIFT", key="Enter", action=wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }}
  #   #   }
  #   # }
  #   # '';
    
  # };
}
