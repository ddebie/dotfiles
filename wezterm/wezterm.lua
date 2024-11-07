-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.enable_tab_bar = false

-- This is where you actually apply your config choices
config.font_size = 13
config.font =
  wezterm.font('Monaspace Neon', { weight = 'Regular', italic = false })

-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'
config.color_scheme = 'Dracula'

-- and finally, return the configuration to wezterm
return config
