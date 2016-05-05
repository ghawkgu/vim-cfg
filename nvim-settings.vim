tnoremap <leader><ESC> <C-\><C-n>
tnoremap <leader>i :startinsert
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

" Easy window navigation
" noremap <C-h> <C-w>h #nvim has some bug with the keycode
noremap <BS> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
