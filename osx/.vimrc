execute pathogen#infect()
:syntax on
:filetype on
:filetype plugin indent on
syntax on
filetype plugin indent on
set ruler
set ttymouse=xterm2
set mouse=a
set ttyfast
set number
set paste
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
set encoding=utf-8
set clipboard=unnamed


autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <C-n> :NERDTreeToggle<CR>

