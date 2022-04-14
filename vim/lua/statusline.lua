local seperator = '│'
local git_branch_symbol = "⌥"

local mode_display = {
    n = "NORMAL",
    no = "Nop",
    nov = "Nop",
    noV = "Nop",
    ["noCTRL-V"] = "Nop",
    niI = "NORMAL",
    niR = "NORMAL",
    niV = "NORMAL",
    v = "VISUAL",
    V = "V-LINE",
    ["ctrl-v"] = "V-BLOCK",
    s = "SELECT",
    S = "S-LINE", ["ctrl-s"] = "S-BLOCK",
    i = "INSERT",
    ic = "INSERT",
    ix = "INSERT",
    r = "REPLACE",
    R = "REPLACE",
    rc = "REPLACE",
    rv = "REPLACE",
    rx = "REPLACE",
    c = "COMMAND",
    cv = "COMMAND",
    ce = "COMMAND",
    r = "PROMPT",
    rm = "PROMPT",
    ["r?"] = "PROMPT",
    ["!"] = "SHELL",
    t = "TERM",
    ["null"] = "NONE"
}
local mode_hl_group = {
    n = "Normal",
    no = "Normal",
    nov = "Normal",
    noV = "Normal",
    ["noCTRL-V"] = "Normal",
    niI = "Normal",
    niR = "Normal",
    niV = "Normal",
    v = "Visual",
    V = "Visual",
    ["ctrl-v"] = "Visual",
    s = "Select",
    S = "Select",
    ["ctrl-s"] = "Select",
    i = "Insert",
    ic = "Insert",
    ix = "Insert",
    r = "Replace",
    R = "Replace",
    rc = "Replace",
    rv = "Replace",
    rx = "Replace",
    c = "Command",
    cv = "Command",
    ce = "Command",
    r = "Prompt",
    rm = "Prompt",
    ["r?"] = "Prompt",
    ["!"] = "Shell",
    t = "Term",
    ["null"] = "None"
}

function mode()
    local hl_group = "StatusLine" .. mode_hl_group[vim.fn.mode()]
    vim.cmd("hi link StatusLineMode " .. hl_group)
    return mode_display[vim.fn.mode()]
end

local function git()
    return "%( %{luaeval('git_branch()')} %)"
end

function git_branch()
    local branch = vim.fn["fugitive#head"]()
    local res = ""
    if #branch > 0 then
        res = git_branch_symbol .. " " .. branch
    end
    return res
end

function modified()
    if vim.o.modified then
        return seperator .. " [+]"
    end
    if not vim.o.ma then
        return seperator .. " [-]"
    end
    return ""
        -- "%( %m %)",
end

function status_line_active()
    if vim.bo.filetype == "NvimTree" then
        return status_line_tree()
    else
        return table.concat{
            "%#StatusLineMode#",
            "%( %{luaeval('mode()')} %)",
            "%#StatusLineLeft#",
            git(),
            "%#StatusLineMiddle#",
            "%( %t %)",
            "%( %{luaeval('modified()')} %)",
            "%=",
            "%( %{&fileformat} %)",
            seperator,
            "%( %{&fileencoding?&fenc:&enc} %)",
            seperator,
            '%( %y %)',
            '%#StatusLineRight#',
            '%( %p%% %)',
            '%#StatusLineFarRight#',
            '%( %3l:%-2c %)'
        }
    end
end

function status_line_inactive() 
    print(vim.bo.filetype)
    return table.concat{
        "%#StatusLineInactive#",
        "%( %t %)",
        "%=",
        '%( %p%% %)',
        '%( %3l:%-2c %)'
    }
end

function status_line_tree()
    return table.concat{
        "%#StatusLineInactive#",
        " Files",
        "%=",
        '%( %3l:%-2c %)'
    }
end

vim.cmd [[
   augroup statusline
     au!
     au winenter,bufenter * setlocal statusline=%!v:lua.status_line_active()
     au winleave,bufleave * setlocal statusline=%!v:lua.status_line_inactive()
     augroup end
]]

