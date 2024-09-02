local wezterm = require 'wezterm'
local config = {}

config.color_scheme = 'Butrin (Gogh)'
config.font_size = 16.0
config.keys = {
  {mods="SUPER", key="Enter", action=wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }},
  {mods="SUPER|SHIFT", key="Enter", action=wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }}
}

return config
