nnoremap <leader>gg <Action>(Vcs.QuickListPopupAction)
nnoremap <leader>gc <Action>(CheckinProject)

nnoremap <leader>gp <Action>(Vcs.Push)

nnoremap <leader>gf <Action>(Git.Fetch)

nnoremap <leader>gm <Action>(Git.Merge)

nnoremap <leader>gS <Action>(Git.Stash)

nnoremap <leader>gU <Action>(Git.Unstash)

nnoremap <leader>gn <Action>(Vcs.Checkout)

nnoremap <leader>gb <Action>(Git.Branches)


" Git status
nnoremap <leader>gs    <Action>(Vcs.Show.Local.Changes)
vnoremap <leader>gs    <Action>(Vcs.Show.Local.Changes)
