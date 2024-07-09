local M = {}

M.apply_to_config = function(config)
    config.hide_tab_bar_if_only_one_tab = false
    config.automatically_reload_config = false
    config.window_padding = { left = 4, right = 0, top = 0, bottom = 0 }
    config.initial_cols = 90
    config.initial_rows = 20
end

return M
