
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
filetype plugin indent on
set ignorecase      " Case insensitive
set laststatus=2    " Always show status line
set mouse=a         " Allow mouse as input device
set nocompatible    " Make VIM more useful
set number          " Show line numbers
set ruler           " Show cursor position
set shiftwidth=2    " Number of spaces to shift for autoindent or >,<
set tabstop=2       " Set Tab
set title           " Show the filename in the window titlebar
syntax on           " Enable syntax highlighting

set expandtab       " No tabs
set autoindent      " Keep tab placement from previous line

"Commands
"-----------------------------
cmap w!! w !sudo tee >/dev/null %

"Plugins
"-----------------------------
" Pathogen plugin manager
execute pathogen#infect() 

" for any plugins that use this, make their keymappings use comma
let mapleader = ","
let maplocalleader = ","

"NERDTreeToggle
nmap \e :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\~$', '\.pyc$']

"Ctrl-P toggle
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py|.min.js|[\/](node_modules|dist)'
let g:ctrlp_max_files=0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0
nmap ; :CTRLPBuffer<CR>

" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=0
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'

"UltiSnips
" Snippets loation
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<C-j>'
let g:UltiSnipsJumpBackwardTrigger='<C-k>'

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit='vertical'

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
