local utils = {}

function utils.packadd(package) 
    vim.cmd("packadd! " .. package)
end

return utils
