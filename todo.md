# Next Feature
+ [-] migrate to just
  + [x] add recipe for FritzNAS
  + [x] add recipe for "_non password shutdown_"
  + [x] install roboto mono
    + [ ] install adobe source pro font
    + [ ] install FiraCode font
  + [x] add recipe for rust-analyzer
+ [x] add recipe and config file for wezterm
+ [ ] add podman recipe
+ [ ] add console email client (neomutt)
  + [ ] config
  + [ ] just recipe
  + [x] setup password-manager (pass)
+ [ ] (partly) migrate nvim-config to lua
+ [ ] make it work on MacOS (with brew)
+ [x] setup git to use `pass`
+ [ ] add _toggle background_ command to vim

# Things to Try
## Cli-Tools
+ [ ] watchexe
+ [ ] xplr
+ [ ] broot

## Terminal Emulator
+ [x] Try wezterm -> use this for a while, seems fun
  + [x] track config
+ [x] Track config for windows terminal
+ [ ] Add tmux and small config -> if switching back to alacritty

## Nvim plugins to try
+ [ ] NERDTree
+ [x] null-ls -> maybe replace ALE with this? can use json.tools for json formatting (python based)
+ [ ] nvim-fzf -> can use fzf or skim :-), does not work on windows :-(
+ [x] vim-python-syntax (now the rtp should be fixed)
Not sure about those:
+ [ ] lsputils -> currently not necessary
+ [-] switch back to completion-nvim? -> not well maintained
+ [-] telescope.nvim -> stay with fzf / skim for now
+ [x] nvim-autopairs
+ [-] nvim-lint (or similar) for linting -> stay with ALE for now, or use nvim-ls

# Futre Organization
+ [x] reinitialize this repo (local and remote)
	+ [x] reinitialize the submodules as needed
+ [x] use ./vim as runtimepath instead of ./vim/rtp
