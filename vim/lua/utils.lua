local utils = {}

function utils.packadd(package)
    vim.cmd("packadd! " .. package)
end

function utils.nnoremap(lhs, rhs)
    vim.keymap.set("n", lhs, rhs, { noremap = true, silent = true })
end

function utils.vnoremap(lhs, rhs)
    vim.keymap.set("v", lhs, rhs, { noremap = true, silent = true })
end

return utils
