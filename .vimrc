"Mappings
"-----------------------------
"Working with buffers
nmap <C-e> :b#<CR>
map <C-n> :bnext<CR>
map <C-p> :bprev<CR>

"Window movement
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"Settings
"-----------------------------
set autoindent      " Keep tab placement from previous line
set expandtab       " No tabs
set ignorecase      " Case insensitive
set laststatus=2    " Always show status line
set nocompatible    " Make VIM more useful
set number          " Show line numbers
set ruler           " Show cursor position
set shiftwidth=2    " Number of spaces to shift for autoindent or >,<
set tabstop=2       " Set Tab
set title           " Show the filename in the window titlebar
syntax on           " Enable syntax highlighting

"Theme and syntax
"-----------------------------
set background=dark
colorscheme solarized
let g:solarized_termtrans=1
let g:jsx_ext_required=0

"Commands
"-----------------------------
cmap w!! w !sudo tee >/dev/null %
