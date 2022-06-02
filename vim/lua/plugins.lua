local function packadd(package)
    vim.cmd("packadd! " .. package)
end

packadd("vim-exchange")
packadd("vim-surround")
packadd("vim-fugitive")
packadd("vim-indent-object")
packadd("vim-commentary")
packadd("vim-rooter")
packadd("vim-just")
packadd("python-syntax")
packadd("rust.vim")
packadd("gv.vim")
