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

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
" Plugin 'tpope/vim-fugitive'
" Plugin 'Lokaltog/vim-easymotion'
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Plugin 'tpope/vim-rails.git'
" vim-scripts repos
" Plugin 'L9'
" Plugin 'FuzzyFinder'
" non github repos
" Plugin 'git://git.wincent.com/command-t.git'
" ...

Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'EasyMotion'
Plugin 'DrawIt'

Plugin 'molokai'
Plugin 'jellybeans.vim'
Plugin 'wombat256.vim'
Plugin 'Wombat'
Plugin 'tir_black'
Plugin 'railscasts'
Plugin 'sexy-railscasts'
Plugin 'candy.vim'

Plugin 'genutils'

" Use vim-airline instead of powerline
Plugin 'bling/vim-airline'
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts=1

Plugin 'The-NERD-tree'
Plugin 'tomtom/tcomment_vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'plasticboy/vim-markdown'
Plugin 'ap/vim-css-color'

" Command-T:  Remember to build the plugin with the system ruby 1.8.7 on Mac OS X
" Plugin 'Command-T'
Plugin 'ctrlp.vim'
Plugin 'matchit.zip'
" Plugin 'ack.vim'
Plugin 'rking/ag.vim'

Plugin 'honza/vim-snippets'
" Plugin 'https://github.com/Shougo/neocomplete.git'
" Plugin 'https://github.com/Shougo/neosnippet.git'
Plugin 'https://github.com/Valloric/YouCompleteMe.git'
Plugin 'https://github.com/vim-scripts/UltiSnips.git'

Plugin 'Tagbar'
Plugin 'tpope/vim-fugitive'
Plugin 'wookiehangover/jshint.vim'
" Plugin 'ZenCoding.vim'
Plugin 'mattn/emmet-vim'
Plugin 'cocoa.vim'

Plugin 'ruby.vim'
if has('ruby')
  Plugin 'rubycomplete.vim'
endif
" Bug-free rails.vim
Plugin 'tpope/vim-rails.git'
Plugin 'spllr/vim-padrino'
Plugin 'slim-template/vim-slim'

Plugin 'https://github.com/othree/javascript-libraries-syntax.vim.git'
Plugin 'kchmck/vim-coffee-script'

Plugin 'editorconfig-vim'

call vundle#end()
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

"LookupFile
"nmap <unique> <silent> <C-S-R> <Plug>LookupFile

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
"nmap <silent> <F4> :QFix<CR>
nmap <silent> <leader>qf :QFix<CR>
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
"nnoremap <silent> <F3> :TagbarToggle<CR>
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
