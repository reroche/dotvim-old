"------------------ RER's vimrc ---------------------

let g:username = "RE Roche"
let g:email = "rers97@gmail.com"

" Pathogen Configuration
execute pathogen#infect()
syntax on
filetype plugin indent on

set t_Co=256 "256 color
set nocompatible  "Kill vi-compatibility
set encoding=utf-8 "UTF-8 character encoding
scriptencoding utf-8
colorscheme seoul256

" General Settings
set background=dark
set mouse=a
set tabstop=2  "2 space tabs
set shiftwidth=2  "2 space shift
set softtabstop=2  "Tab spaces in no hard tab mode
set expandtab  " Expand tabs into spaces
set autoindent  "autoindent on new lines
set showmatch  "Highlight matching braces
set ruler  "Show bottom ruler
set equalalways  "Split windows equal size
set formatoptions=croq  "Enable comment line auto formatting
set title  "Set window title to file
set hlsearch  "Highlight on search
set ignorecase  "Search ignoring case
set smartcase  "Search using smartcase
set incsearch  "Start searching immediately
set scrolloff=7  "Never scroll off
set wildmode=longest,list  "Better unix-like tab completion
set clipboard=unnamed  "Copy and paste from system clipboard
set lazyredraw  "Don't redraw while running macros (faster)
set wrap  "Visually wrap lines
set linebreak  "Only wrap on 'good' characters for wrapping
set backspace=indent,eol,start  "Better backspacing
set linebreak  "Intelligently wrap long files
set ttyfast  "Speed up vim
set nostartofline "Vertical movement preserves horizontal position
set relativenumber "Sets relative line numbers
set number " Sets current line to absolute not relative number
set noshowmode " Hide the default mode indicator
set colorcolumn=81 " Sets a marker at column 81
set pastetoggle=<F3> " Use shortcut to toggle PASTE mode
set signcolumn=yes " Add a column to the left of numbers for 'signs'
set cursorline

" Strip whitespace from end of lines when writing file
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufRead,BufNewFile *.md setlocal tw=150  spell colorcolumn=150

set omnifunc=syntaxcomplete#Complete
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red

"------------ C Language Settings -------------------------
autocmd FileType c setlocal shiftwidth=2 tabstop=2 softtabstop=2

"--------------- Key Mapping -----------------------
let mapleader=','
vnoremap jk <esc>
inoremap jk <esc>
nnoremap fd :w!<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>q :q<CR>
nnoremap U <C-r>
nnoremap <F5> :r !date
nnoremap <Space> i*<Esc>r
nnoremap <leader>s :SyntasticToggleMode<CR>

"-------------- NERDTree -------------------------
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <silent><leader>v :NERDTreeFind<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"--------------- Vimwiki --------------------------
let g:vimwiki_ext2syntax = {'.md': '.markdown', '.mdown': 'markdown'}
let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_dir_link = 'index'
let g:vimwiki_hl_headers = 1
let g:vimwiki_hl_cb_checked = 1
" disable the <tab> mapping provided by vimwiki, which interferes with SuperTab
let g:vimwiki_table_mappings = 0
let g:vimwiki_global_ext = 0

" Markdown preview
let vim_markdown_preview_pandoc=1


"-------------- Syntastic -------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1
let g:syntastic_cpp_checkers=['gcc']
"
"-------------- vim-airline ------------------
" Always show statusbar
set laststatus=2
" Show PASTE if in paste mode
let g:airline_detect_paste=1
" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
let g:airline#extensions#tmuxline#enabled = 0
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ ''   : 'S'}

"-------------- tmuxline -----------------------
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'c'    : '%Y-%m-%d | %a | %R',
      \'win'  : ['#I','#W'],
      \'cwin' : ['#I','#W'],
      \'w'    : '#(echo "Hi")',
      \'y'    : '#(~/.vim/battery_indicator.sh)',
      \'x'    : '#(~/.vim/spotify.sh)',
      \'z'    : '#h'}

"--------------- YouCompleteMe ------------------
let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_server_python_interpreter = '/usr/bin/python2'

"---------------- Vimux -------------------------
map <leader>g :call VimuxRunCommand("clear; g++ " . expand('%:t') . " && ./a.out")<CR>
map <leader>gg :call VimuxRunLastCommand()<CR>
