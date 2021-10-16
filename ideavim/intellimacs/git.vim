nnoremap <leader>gc :action CheckinProject<CR> 

nnoremap <leader>gp :action Vcs.Push<CR>

nnoremap <leader>gf :action Git.Fetch<CR>

nnoremap <leader>gm :action Git.Merge<CR>

nnoremap <leader>gS :action Git.Stash<CR>

nnoremap <leader>gU :action Git.Unstash<CR>

nnoremap <leader>gn :action Vcs.Checkout<CR>

nnoremap <leader>gb :action Git.Branches<CR>


" Git status
nnoremap <leader>gs    :action Vcs.Show.Local.Changes<CR>
vnoremap <leader>gs    :action Vcs.Show.Local.Changes<CR>
