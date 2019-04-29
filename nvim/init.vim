" Plugin loading. Toggle installation with :PlugInstall
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
" Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'w0rp/ale'
Plug 'morhetz/gruvbox'

call plug#end()

let mapleader = ","
nmap <leader>n :NERDTreeToggle<cr>

" commenting
imap <C-_> <Esc>gc$
nmap <C-_> gc$
vmap <C-_> gc

inoremap jj <Esc>

" autoindent
filetype plugin indent on

" tabs should be spaces
set tabstop=4
set shiftwidth=4
set expandtab

" tab forwrad and backwards
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" color
set background=dark
color gruvbox
hi Normal ctermbg=None

" line numbers
set number

let b:ale_linters = ['flake8', 'pyls']
let g:ale_completion_enabled = 1

let g:gruvbox_underline = 0
