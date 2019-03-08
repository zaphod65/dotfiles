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

set nowritebackup
set noswapfile
set nobackup

set mouse-=a

filetype on

au BufRead,BufNewFile *.go set filetype=go
noremap <leader>o :tabe <bar> :Explore<CR>

inoremap <leader><space> :noh<CR>

noremap <leader>j :%!python -m json.tool<CR>

set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:_

set laststatus=2
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tableine#buffer_nr_show=1

set go=i

noremap <leader><Right> :bn<CR>
noremap <leader><Left> :bp<CR>

nmap <Left> <<
nmap <Right> >>
vmap <Left> <gv
vmap <Right> >gv

set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>
nnoremap <F10> :b <C-Z>

" no audio or visual bell
set noeb vb t_vb=
" air-line fonts
let g:airline_powerline_fonts = 1

" enable ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim

" file browser open in new buffer
let g:netrw_liststyle=3
