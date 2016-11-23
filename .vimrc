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

"Commands
"-----------------------------
cmap w!! w !sudo tee >/dev/null %

"Plugins
"-----------------------------
" Pathogen plugin manager
execute pathogen#infect() 

"Theme and syntax
"-----------------------------
set background=dark
if !has('gui_running')
  if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
    set t_Co=256
  elseif has("terminfo")
    colorscheme default
    set t_Co=8
    set t_Sf=[3%p1%dm
    set t_Sb=[4%p1%dm
  else
    colorscheme default
    set t_Co=8
    set t_Sf=[3%dm
    set t_Sb=[4%dm
  endif
endif
let g:solarized_termtrans=1
colorscheme monokai

let g:jsx_ext_required=0
