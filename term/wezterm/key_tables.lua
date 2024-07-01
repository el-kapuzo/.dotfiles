local wezterm    = require 'wezterm'
local act        = wezterm.action

local M          = {}

local key_tables = {
    pane = {
        {
            key = "s",
            action = act {
                SplitVertical = { domain = "CurrentPaneDomain" }
            }
        },
        {
            key = "v",
            action = act {
                SplitHorizontal = { domain = "CurrentPaneDomain" }
            }
        },
        {
            key = "d",
            action = act {
                CloseCurrentPane = { confirm = false }
            }
        },
        {
            key = "z",
            action = "TogglePaneZoomState"
        },
        {
            key = "h",
            action = act.ActivatePaneDirection "Left",
        },
        {
            key = "j",
            action = act.ActivatePaneDirection "Down",
        },
        {
            key = "k",
            action = act.ActivatePaneDirection "Up",
        },
        {
            key = "l",
            action = act.ActivatePaneDirection "Right",
        },
        {
            key = "h",
            mods = "CTRL",
            action = act.AdjustPaneSize { "Left", 5 },
        },
        {
            key = "j",
            mods = "CTRL",
            action = act.AdjustPaneSize { "Down", 5 },
        },
        {
            key = "k",
            mods = "CTRL",
            action = act.AdjustPaneSize { "Up", 5 }
        },
        {
            key = "l",
            mods = "CTRL",
            action = act.AdjustPaneSize { "Right", 5 },
        },
        {
            key = "q",
            action = act.CloseCurrentPane { confirm = false },
        },
        {
            key = "Escape",
            action = "PopKeyTable",
        },
    },
    application = {
        {
            key = "q",
            action = "QuitApplication",
        },
        {
            key = "f",
            action = "ToggleFullScreen",
        },
        {
            key = "r",
            action = "ReloadConfiguration",
        },
        {
            key = "0",
            action = "ResetFontSize",
        },
        {
            key = "+",
            action = "IncreaseFontSize",
        },
        {
            key = "-",
            action = "DecreaseFontSize",
        },
        {
            key = "Escape",
            action = "PopKeyTable",
        },
    },
    tabs = {
        {
            key = "n",
            action = act.SpawnTab 'CurrentPaneDomain',
        },
        {
            key = "l",
            action = act.ActivateTabRelative(1),
        },
        {
            key = "h",
            action = act.ActivateTabRelative(-1)
        },
        {
            key = "q",
            action = act.CloseCurrentTab { confirm = false },
        },
        {
            key = "Escape",
            action = "PopKeyTable",
        }
    }
}

local function apply_to_config(config)
    config.key_tables = key_tables
end

M.apply_to_config = apply_to_config

return M
