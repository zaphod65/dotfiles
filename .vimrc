set number
syntax on

set backspace=2
set tabstop=4
set shiftwidth=4
set expandtab

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
	colorscheme slate
endif

noremap <Left> <nop>
noremap <Right> <nop>
noremap <Down> <nop>
noremap <Up> <nop>

inoremap <Left> <nop>
inoremap <Right> <nop>
inoremap <Down> <nop>
inoremap <Up> <nop>

nmap <CR><CR> o<Esc>

set nowritebackup
set noswapfile
set nobackup

set mouse-=a

filetype on

au BufRead,BufNewFile *.go set filetype=go
noremap <leader>o :tabe <bar> :Explore<CR>
noremap <leader><space> :noh<CR>

noremap <leader>j :%!python -m json.tool<CR>

set laststatus=2

set go-=r
set go-=m
set go-=T
set go-=L
