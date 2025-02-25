-- Pull in the wezterm API
local wezterm = require 'wezterm'
local config = wezterm.config_builder()
config.color_scheme = 'Zenburn (Gogh)'
config.audible_bell = "Disabled"
config.enable_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"

-- Set Source Code Pro as the font
config.font = wezterm.font {
  family = 'Source Code Pro',
  -- You can adjust the weight if desired:
  -- weight = 'Medium',
  -- You can also specify size here:
  -- size = 14.0,
}

-- Optional: Set font size
config.font_size = 14.0

-- and finally, return the configuration to wezterm
return config
