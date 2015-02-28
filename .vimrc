set number
syntax on

set backspace=2
set tabstop=4
set shiftwidth=4

set showcmd
set nocompatible
set title

set autoindent
set smartindent

set splitbelow
set splitright

set ignorecase
set smartcase
set hlsearch
set incsearch

if &readonly
	colorscheme delek
else
	colorscheme dante
endif

noremap <Left> <nop>
noremap <Right> <nop>
noremap <Down> <nop>
noremap <Up> <nop>

inoremap <Left> <nop>
inoremap <Right> <nop>
inoremap <Down> <nop>
inoremap <Up> <nop>

set nowritebackup
set noswapfile
set nobackup

set mouse-=a
