local wezterm = require 'wezterm'
local key_tables = require 'key_tables'
local key_mapping = require 'key_mapping'
local colors = require 'colors'
local windows = require 'windows'
local font = require 'font'

local config = wezterm.config_builder()

key_tables.apply_to_config(config)
key_mapping.apply_to_config(config)
colors.apply_to_config(config)
windows.apply_to_config(config)
font.apply_to_config(config)

-- Cursor
config.force_reverse_video_cursor = true

return config
