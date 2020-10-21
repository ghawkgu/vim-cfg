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

let g:python3_host_prog = "$HOME/.pyenv/shims/python"

" let g:python_version = matchstr(system("python --version | cut -f2 -d' '"), '^[0-9]')
" if g:python_version =~ 3
"     let g:python2_host_prog = "$HOME/.pyenv/shims/python"
" else
"     let g:python3_host_prog = "$HOME/.pyenv/shims/python"
" endif

" let g:loaded_ruby_provider = 1
" let g:loaded_python_provider = 1
" let g:loaded_python3_provider = 1
