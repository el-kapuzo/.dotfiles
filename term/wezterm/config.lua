local wezterm = require 'wezterm'
local key_tables = require 'key_tables'
local key_mapping = require 'key_mapping'

local config = wezterm.config_builder()

key_tables.apply_to_config(config)
key_mapping.apply_to_config(config)

-- Window configuration
config.hide_tab_bar_if_only_one_tab = false
config.automatically_reload_config = false
config.window_padding = { left = 4, right = 0, top = 0, bottom = 0 }
config.initial_cols = 90
config.initial_rows = 20

-- Cursor
config.force_reverse_video_cursor = true

-- Font related settings
config.font_size = 14
config.line_height = 1.2
config.adjust_window_size_when_changing_font_size = false
config.font = wezterm.font { family = "Fira Code", harfbuzz_features = { "calt=0", "clig=0", "liga=0" } }

-- Color related settings
config.color_scheme = 'el_light'
config.command_palette_fg_color = "#121212"
config.command_palette_bg_color = "#ebdbb2"
config.inactive_pane_hsb = {
    saturation = 0.95,
    brightness = 0.9,
}

return config
