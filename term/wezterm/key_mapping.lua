local wezterm = require 'wezterm'

local leader = { key = "b", mods = "CTRL" }

local keys = {
    { key = "p", mods = "LEADER", action = wezterm.action.ActivateKeyTable { name = "pane", one_shot = false } },
    { key = "a", mods = "LEADER", action = wezterm.action.ActivateKeyTable { name = "application", one_shot = true, timeout_milliseconds = 1000 } },
    { key = "t", mods = "LEADER", action = wezterm.action.ActivateKeyTable { name = "tabs", one_shot = true, timeout_milliseconds = 1000 } },

    -- we need a way to send CTRL+b to the running program
    { key = "b", mods = "LEADER", action = { SendKey = { key = "b", mods = "CTRL" } } }
}

local M = {}
M.apply_to_config = function(config)
    config.leader = leader
    config.keys = keys
end

return M
