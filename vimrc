" Pathogen Configuration
execute pathogen#infect()
syntax on
filetype plugin indent on

set t_Co=256 "256 color
set nocompatible  "Kill vi-compatibility
set encoding=utf-8 "UTF-8 character encoding
scriptencoding utf-8

" General Settings
set background=dark
set mouse=a
set tabstop=4  "4 space tabs
set shiftwidth=4  "4 space shift
set softtabstop=4  "Tab spaces in no hard tab mode
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

" Vim Colorscheme
colorscheme seoul256

" Strip whitespace from end of lines when writing file
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufRead,BufNewFile *.md setlocal tw=150  spell colorcolumn=150

" C Language Settings
autocmd FileType c setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Key Mapping
vnoremap jk <esc>
inoremap jk <esc>
nnoremap fd :w!<CR>
let mapleader=','
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>ss :w!<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>pr :colorscheme random<CR>
nnoremap <leader>pb :colorscheme brogrammer<CR>
nnoremap <leader>pe :colorscheme busybee<CR>
nnoremap <leader>ps :colorscheme seoul256<CR>
nnoremap U <C-r>
nnoremap <F5> :r !date
nnoremap <Space> i*<Esc>r

" NERDTree and NERDTree Tabs
map <leader>t :NERDTreeTabsToggle<CR>
"let g:nerdtree_tabs_open_on_console_startup=1

" Vimwiki
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_list = [{'path': '$HOME/Documents/wiki', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_dir_link = 'index'
let g:vimwiki_hl_headers = 1
let g:vimwiki_table_mappings = 0
let g:vimwiki_hl_cb_checked = 1
" disable the <tab> mapping provided by vimwiki, which interferes with SuperTab
let g:vimwiki_table_mappings = 0


" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1
"
"-------------- vim-airline settings ------------------
" Always show statusbar
set laststatus=2
" Show PASTE if in paste mode
let g:airline_detect_paste=1
" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
" set guifont=Meslo\ LG\ S\ Regular\ for\ Powerline
" let g:airline_section_x = '%{PencilMode()}'
let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '#(~/dotfiles/battery_indicator.sh)',
      \'c'    : '#(echo "Take it easy, dude")',
      \'win'  : ['#I','#W'],
      \'cwin' : ['#I','#W'],
      \'x'    : '#(osascript ~/dotfiles/tunes.scpt)',
      \'y'    : '%R',
      \'z'    : '#h'}


" Vim Lightline
" Settings assume patched font is installed.
" let g:lightline = {
"       \ 'colorscheme': 'powerline',
"       \ 'mode_map': { 'c': 'NORMAL' },
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste'], [ 'fugitive', 'filename' ] ]
"       \ },
"       \ 'component_function': {
"       \   'modified': 'LightlineModified',
"       \   'readonly': 'LightlineReadonly',
"       \   'fugitive': 'LightlineFugitive',
"       \   'filename': 'LightlineFilename',
"       \   'fileformat': 'LightlineFileformat',
"       \   'filetype': 'LightlineFiletype',
"       \   'fileencoding': 'LightlineFileencoding',
"       \   'mode': 'LightlineMode',
"       \ },
"       \ 'separator': { 'left': '', 'right': '' },
"       \ 'subseparator': { 'left': '', 'right': '' }
"       \ }
"
" function! LightlineModified()
"   return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
" endfunction
"
" function! LightlineReadonly()
"   return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '' : ''
"  endfunction
"
" function! LightlineFilename()
"   return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
"      \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
"      \  &ft == 'unite' ? unite#get_status_string() :
"      \  &ft == 'vimshell' ? vimshell#get_status_string() :
"      \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
"      \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
" endfunction
"
" function! LightlineFugitive()
"   if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
"      let branch = fugitive#head()
"      return branch !=# '' ? ' '.branch : ''
"    endif
"    return ''
" endfunction
"
" function! LightlineFileformat()
"       return winwidth(0) > 70 ? &fileformat : ''
" endfunction
"
" function! LightlineFiletype()
"   return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
" endfunction
"
" function! LightlineFileencoding()
"   return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
" endfunction
"
" function! LightlineMode()
"   return winwidth(0) > 60 ? lightline#mode() : ''
" endfunction

" NOTE: Use these settings if the patched font is not installed, i.e. when using ssh
"let g:lightline = {
"      \ 'colorscheme': 'wombat',
"      \ 'component': {
"      \   'readonly': '%{&readonly?"x":""}',
"      \ },
"      \ 'separator': { 'left': '', 'right': '' },
"      \ 'subseparator': { 'left': '|', 'right': '|' }
"      \ }


