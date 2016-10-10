if has("win32")
    let $VIMFILES = $VIM.'/vimfiles'
    let $V = $VIM.'/_vimrc'
else
    let $VIMFILES = $HOME.'/.vim'
    let $V = $HOME.'/.vimrc'
endif

set nocompatible               " be iMproved
filetype off                   " required!

if &term =~ '^screen'
    " tmux will send xterm-style keys when xterm-keys is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

" Disable ruby (neovim)
let g:loaded_ruby_provider = 1

" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
  execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'EasyMotion'
Plug 'DrawIt'

Plug 'molokai'
Plug 'jellybeans.vim'
Plug 'wombat256.vim'
Plug 'Wombat'
Plug 'tir_black'
Plug 'railscasts'
Plug 'sexy-railscasts'
Plug 'candy.vim'

Plug 'genutils'

" Use vim-airline instead of powerline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
source  $VIMFILES/airline-settings.vim

" Plug 'The-NERD-tree'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/vim-easy-align'
Plug 'plasticboy/vim-markdown'
Plug 'ap/vim-css-color'

Plug 'ctrlp.vim'
Plug 'matchit.zip'
" Plugin 'ack.vim'
Plug 'rking/ag.vim'

" Plugin 'https://github.com/Shougo/neocomplete.git'
" Plugin 'https://github.com/Shougo/neosnippet.git'
Plug 'https://github.com/Valloric/YouCompleteMe.git', { 'do': './install.py --clang-completer' }
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'Tagbar'
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'
Plug 'cocoa.vim'

Plug 'ruby.vim'
if has('ruby')
  Plug 'rubycomplete.vim'
endif
" Bug-free rails.vim
Plug 'tpope/vim-rails'
Plug 'spllr/vim-padrino'
Plug 'slim-template/vim-slim'

Plug 'https://github.com/othree/javascript-libraries-syntax.vim.git', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'isRuslan/vim-es6', { 'for': 'javascript' }

Plug 'editorconfig-vim'
Plug 'scrooloose/syntastic'

call plug#end()

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

"----------- Begin with the configuration -----------
set t_Co=256
set t_ut=
syntax on
"set nu
set nocompatible
set numberwidth=5
set fencs=utf-8,eucjp,shiftjis,gb18030,gbk
set enc=utf-8

set wildmenu
set nonumber
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent
set incsearch
set ignorecase
set smartcase

set lazyredraw

set hlsearch "high-light search
"The cursor jumps to the paired one if showmatch is turned on,
"this really bothers me.
"set showmatch

" if $TMUX == '' # Since the clipboard is working fine under tmux
set clipboard+=unnamed
set clipboard+=unnamedplus
" endif

"colorscheme ir_black
let g:molokai_original=1
"colorscheme jellybeans
colorscheme wombat256mod
"colorscheme railscasts
"colorscheme sexy-railscasts

"call pathogen#infect()

if has('gui_running')
    set lines=50 columns=160
endif

set directory=$VIMFILES/tmp//
set backupdir=$VIMFILES/bak

" Use Node.js for JavaScript interpretation
let $JS_CMD='node'

" Disable the scratch window while the auto-completion is working.
set completeopt=menu,menuone,longest
filetype plugin on
set ofu=syntaxcomplete#Complete
autocmd Filetype html  setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype ruby  setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype eruby setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype yaml  setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype javascript,coffee  setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype text  setlocal textwidth=0
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType c set omnifunc=ccomplete#Complete

function! GetStatusEx()
    let str = ''
    let str = str . '[\n:' . &fileformat . ']'
    if has('multi_byte') && &fileencoding != ''
        let str = str . '[enc:' . &fileencoding . ']'
    else
        let str = str . '[enc:default(utf-8)]'
    endif
    return str
endfunction

" Auto complete settings
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<s-tab>"
source $VIMFILES/ycm_with_ultrisnip.vim
" source $VIMFILES/neocomplete.vim

" Powerline settings
let g:Powerline_symbols = 'fancy'
if has('gui_running')
  " Set font for macvim. The font can be downloaded from https://gist.github.com/1838072 .
  set guifont=Monaco\ for\ Powerline:h12
  set linespace=-1
  " set guifont=Anonymous\ Pro\ for\ Powerline:h14
  " set linespace=3
  " set transparency=5        " set transparent window
  " set guioptions=egmrt  " hide the gui menubar
endif

"ステータスバーの表示
set statusline=%<%f%h\ %y%m%r\ %{GetStatusEx()}\ %{fugitive#statusline()}%=%b\ 0x%B\ \ \ %l,%c%V\ %P

" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=1
" コマンドをステータス行に表示
set showcmd

"Key mapping for insert mode
"inoremap <C-F> <C-O>l
"inoremap <C-B> <C-O>h
inoremap <C-F> <Right>
inoremap <C-B> <Left>
inoremap <C-A> <Home>
inoremap <C-E> <End>

"command-line の編集
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <C-A> <Home>
cnoremap <C-E> <End>

" Easy window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

"全置換マップ
" vnoremap <C-S> y:%s/<C-R>"//gc<Left><Left><Left>
vnoremap <C-S> y:%s/<C-R>=escape(@", '.*/\[]^$+?\|{}()')<CR>//gc<Left><Left><Left>
nnoremap <C-S> :%s/<C-R><C-W>//gc<Left><Left><Left>


"Toggle list mode on/off
noremap <silent> <F10> :set list!<CR>
" set listchars=eol:$,tab:>-,trail:.,extends:>,precedes:<,nbsp:_
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,nbsp:_,trail:-
highlight SpecialKey term=standout ctermbg=yellow guibg=yellow
highlight RedundantSpaces term=standout ctermbg=Grey guibg=#ffddcc
call matchadd('RedundantSpaces', '\(\s\+$\| \+\ze\t\|\t\zs \+\)\(\%#\)\@!')
"End of list mode settings

"Toggle line number on/off
noremap <silent> <F9> :set number!<CR>

"Toggle cursor line/column highlight on/off
"To override the default color, apply the following settings:
"ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" highlight CursorLine cterm=underline gui=underline
highlight CursorLine term=none cterm=none gui=none
"highlight CursorColumn cterm=none gui=none
" set nocursorline
"set cursorcolumn
nnoremap <silent> <F11> :set cursorline!<CR>

"Toggle highlight search
noremap <silent> <F12> :set hlsearch!<CR>

"Toggle NERD tree
let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=40
"noremap <silent> <F2> :NERDTreeToggle<CR>
noremap <silent> <leader>nt :NERDTreeToggle<CR>

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" QUICKFIX WINDOW
" @see http://c9s.blogspot.com/2007/10/vim-quickfix-windows.html
command! -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
    if exists("g:qfix_win") && a:forced == 0
        botright cclose
        unlet g:qfix_win
    else
        botright copen 10
        let g:qfix_win = bufnr("$")
    endif
endfunction
"nnoremap <leader>q :QFix<CR>

" close quickfix window.
"nmap <F4> :cclose<CR>
"nmap <silent> <F4> :QFix<CR>
nmap <silent> <leader>qf :QFix<CR>
" next quickfix line.
"map <F8> :cn<CR>
" prev quickfix line.
"map <F7> :cp<CR>
" compile c/cpp code.

set tags+=./.tags
nnoremap <silent> <leader>tb :TagbarToggle<CR>

"Zencoding setting
let g:user_zen_settings = {
\  'indentation' : '  ',
\  'perl' : {
\    'aliases' : {
\      'req' : 'require '
\    },
\    'snippets' : {
\      'use' : "use strict\nuse warnings\n\n",
\      'warn' : "warn \"|\";",
\    }
\  }
\}

let g:user_zen_expandabbr_key = '<leader>e'
let g:use_zen_complete_tag = 1

let g:user_emmet_expandabbr_key = '<leader>e'

function! EnableCursorLine()
    " Disable the cursorline for tagbar, because there is a great performance
    " hit if it is enabled.
    if &ft =~ 'tagbar'
        setlocal nocursorline
        return
    endif
    setlocal cursorline
endfunction

" Highlight the cursorline only in the active window.
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * call EnableCursorLine()
    au WinLeave * setlocal nocursorline
augroup END

" Eliminate the trailing space.
function! RemoveTrailingSpaces()
    if &ft =~ 'markdown'
        return
    endif
    :%s/\s\+$//e
endfunction

autocmd BufWritePre * call RemoveTrailingSpaces()

" CtrlP's key mapping
let g:ctrlp_map = '<leader>t'

" vim-padrino's bug
let g:padrino_statusline=0

let g:used_javascript_libs = 'jquery,angularjs'

" Easy-align
vnoremap <silent> <Enter> :EasyAlign<cr>

" Enable the curline and listchars only in the insert mode
function! EnterInsertMode()
    setlocal listchars-=eol:¬
    setlocal list
    highlight CursorLine term=underline cterm=underline gui=underline
    " setlocal cursorline
endfunction

function! ExitInsertMode()
    setlocal listchars+=eol:¬
    setlocal nolist
    highlight CursorLine term=none cterm=none gui=none
    " setlocal nocursorline
endfunction

augroup HighlightSpecialKeys
    au!
    au InsertEnter * call EnterInsertMode()
    au InsertLeave * call ExitInsertMode()
augroup END

let g:vim_markdown_folding_disabled=1

" Fugitive {{{
let g:fugitive_github_domains = ['github.com']

nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>ga :Gadd<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gco :Gcheckout<cr>
nnoremap <leader>gci :Gcommit<cr>
nnoremap <leader>gm :Gmove<cr>
nnoremap <leader>gr :Gremove<cr>
nnoremap <leader>gl :! git lg <cr>:wincmd \|<cr>
" }}}

highlight SpellBad cterm=standout ctermfg=red ctermbg=none

" resize current buffer by +/- 5
nnoremap <S-Left> :vertical resize -5<cr>
nnoremap <S-Down> :resize +5<cr>
nnoremap <S-Up> :resize -5<cr>
nnoremap <S-Right> :vertical resize +5<cr>

" EditorConfig settings
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_checkers = ['standard']
autocmd FileType javascript let b:syntastic_checkers = glob('*eslintrc*', '.;') != '' ? ['eslint'] : ['standard']

if has('nvim')
  source $VIMFILES/nvim-settings.vim
endif
