-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Aura (Gogh)'

config.enable_scroll_bar = true

config.font = wezterm
  .font_with_fallback {
    'JetBrains Mono',
    'BIZ UDGothic',
  }

config.font_size = 16

config.initial_cols = 120
config.initial_rows = 30

config.mouse_bindings = {
  {
    event = { Up = { streak = 1, button = "Left" } },
    mods = "NONE",
    action = wezterm.action.Nop,
  },
}

-- and finally, return the configuration to wezterm
return config
