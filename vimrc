if has("win32")
    let $VIMFILES = $VIM.'/vimfiles'
    let $V = $VIM.'/_vimrc'
else
    let $VIMFILES = $HOME.'/.vim'
    let $V = $HOME.'/.vimrc'
endif

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
" Bundle 'tpope/vim-fugitive'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'tpope/vim-rails.git'
" vim-scripts repos
" Bundle 'L9'
" Bundle 'FuzzyFinder'
" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
" ...

Bundle 'surround.vim'
Bundle 'EasyMotion'

Bundle 'molokai'
Bundle 'jellybeans.vim'
Bundle 'wombat256.vim'
Bundle 'Wombat'
Bundle 'tir_black'
Bundle 'railscasts'
Bundle 'sexy-railscasts'
Bundle 'candy.vim'

Bundle 'genutils'

" Use vim-airline instead of powerline
Bundle 'bling/vim-airline'
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts=1

Bundle 'The-NERD-tree'
Bundle 'tomtom/tcomment_vim'
Bundle 'junegunn/vim-easy-align'
Bundle 'plasticboy/vim-markdown'
Bundle 'ap/vim-css-color'

" Bundle 'bufexplorer.zip'
" Command-T:  Remember to build the plugin with the system ruby 1.8.7 on Mac OS X
" Bundle 'Command-T'
Bundle 'ctrlp.vim'
Bundle 'matchit.zip'
Bundle 'ack.vim'
" Bundle 'snipMate'
Bundle 'snipmate-snippets'
Bundle 'neocomplcache'
Bundle 'https://github.com/Shougo/neosnippet.git'
Bundle 'Tagbar'
Bundle 'tpope/vim-fugitive'
Bundle 'jslint.vim'
Bundle 'ZenCoding.vim'
Bundle 'cocoa.vim'

Bundle 'ruby.vim'
if has('ruby')
  Bundle 'rubycomplete.vim'
endif
" Bug-free rails.vim
Bundle 'tpope/vim-rails'
Bundle 'spllr/vim-padrino'
Bundle 'slim-template/vim-slim'

Bundle 'https://github.com/othree/javascript-libraries-syntax.vim.git'

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
syntax on
"set nu
set nocompatible
set numberwidth=5
set fencs=utf-8,gb18030,gbk,eucjp,shiftjis
set enc=utf-8

set wildmenu
set nonumber
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent
set incsearch

set hlsearch "high-light search
"The cursor jumps to the paired one if showmatch is turned on,
"this really bothers me.
"set showmatch

if $TMUX == ''
    set clipboard+=unnamed
endif

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

set directory=~/vim-tmp,~/tmp,/var/tmp,/tmp
set backupdir=~/vim-bak,~/tmp

" Use the independent snippets directory. (snipMate)
let g:snippets_dir = '~/.vim/snippets'

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

" neocomplcache
source $VIMFILES/neocomplcache.vim

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

"全置換マップ
vnoremap <C-S> y:%s/<C-R>"//gc<Left><Left><Left>
nnoremap <C-S> :%s/<C-R><C-W>//gc<Left><Left><Left>

"LookupFile
"nmap <unique> <silent> <C-S-R> <Plug>LookupFile

"Toggle list mode on/off
noremap <silent> <F10> :set list!<CR>
set listchars=eol:$,tab:>-,trail:.,extends:>,precedes:<,nbsp:_
highlight SpecialKey term=standout ctermbg=yellow guibg=yellow
highlight RedundantSpaces term=standout ctermbg=Grey guibg=#ffddcc
call matchadd('RedundantSpaces', '\(\s\+$\| \+\ze\t\|\t\zs \+\)\(\%#\)\@!')
"End of list mode settings

"Toggle line number on/off
noremap <silent> <F9> :set number!<CR>

"Toggle cursor line/column highlight on/off
"To override the default color, apply the following settings:
"ctermbg=darkred ctermfg=white guibg=darkred guifg=white
highlight CursorLine   cterm=underline gui=underline
"highlight CursorLine cterm=none gui=none
"highlight CursorColumn cterm=none gui=none
set cursorline
"set cursorcolumn
nnoremap <silent> <F11> :set cursorline!<CR>

"Toggle highlight search
noremap <silent> <F12> :set hlsearch!<CR>

"Toggle NERD tree
let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=30
noremap <silent> <F2> :NERDTreeToggle<CR>

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

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
nmap <silent> <F4> :QFix<CR>
" next quickfix line.
"map <F8> :cn<CR>
" prev quickfix line.
"map <F7> :cp<CR>
" compile c/cpp code.
" autocmd FileType cpp,c nmap <F5> :setlocal makeprg=make<CR>:make<CR> :copen<CR> <C-W>10_
"autocmd FileType javascript nmap <F5> :make<CR>
if exists("JsonLint")
    autocmd FileType javascript nmap <F6> :call JsonLint()<CR>
endif
"autocmd FileType html,xhtml,css nmap <F5> :make<CR><CR>:copen<CR>
"autocmd FileType cpp,c nmape <F10> :!g++ -o %:r.exe %<CR><CR>
" @see http://easwy.com/blog/archives/advanced-vim-skills-quickfix-mode/
"      http://blog.zdnet.com.cn/html/30/422230-2881199.html
"autocmd FileType cpp nmap <F5> :w<CR>:setlocal makeprg=g++\ -Wall\ -o\ %:r.exe\ %<CR>:make<CR><CR>:cw<CR>
"autocmd FileType c nmap <F5> :w<CR>:setlocal makeprg=gcc\ -Wall\ -o\ %:r.exe\ %<CR>:make<CR><CR>:cw<CR>
" @see http://csstidy.sourceforge.net/
" autocmd FileType css nmap <F5> :!csstidy %:p --preserve_css=false --remove_bslash=false --compress_color=true --lowercase_s=false --timestamp=false --optimise_shorthands=0 --remove_last_\;=true --sort_selectors=false --merge_selectors=0 --compress_font-weight=false --allow_html_in_template=false --silent=true --case_properties=0 --template=default %:p:r.min.%:p:e<CR><CR>
" run current code.
"autocmd FileType cpp,c nmap <F5> :!%:r.exe
"autocmd FileType xhtml,html nmap <F5> :call Save2Temp()<CR><CR>:!start "E:\Mozilla Firefox\firefox.exe" -P debug %<CR>
"autocmd FileType xhtml,html nmap <F5> :call Save2Temp()<CR><CR>:!start "RunDll32.exe shell32.dll,ShellExec_RunDLL %:p<CR>
"autocmd FileType dosbatch nmap <F5> :!%<CR><CR>

set tags+=./.tags
nnoremap <silent> <F3> :TagbarToggle<CR>

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
