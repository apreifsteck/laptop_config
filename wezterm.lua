local wezterm = require 'wezterm'
local config = {}

config.color_scheme = 'Butrin (Gogh)'
config.font_size = 16.0
config.keys = {
  {mods="SUPER", key="Enter", action=wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }},
  {mods="SUPER|SHIFT", key="Enter", action=wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }},
  {mods="CTRL|SHIFT", key="e", action=wezterm.action.ActivatePaneDirection "Right" },
  {mods="CTRL|SHIFT", key="n", action=wezterm.action.ActivatePaneDirection "Left" },
  {mods="SUPER|SHIFT", key="n", action=wezterm.action.ActivateTabRelative(-1) },
  {mods="SUPER|SHIFT", key="e", action=wezterm.action.ActivateTabRelative(1) }
}

return config
