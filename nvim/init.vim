" Plugin loading. Toggle installation with :PlugInstall
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'ervandew/supertab'
Plug 'w0rp/ale'
Plug 'morhetz/gruvbox'
Plug 'tomasiser/vim-code-dark'

call plug#end()

let mapleader = " "

" NERDTREE
nmap <leader>o :NERDTreeToggle<cr>
" close nerdtree if it's the last open buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" close nerdtree on file open
let NERDTreeQuitOnOpen=1

" buffergator
nmap <leader>b :BuffergatorToggle<cr>

" go back to last opened buffer
nmap <leader>p :b#<cr>

" Disable guicursor it was making it write random characters within tmux
set guicursor=

" commenting
imap <C-_> <Esc>gc$
nmap <C-_> gc$
vmap <C-_> gc

" jj to exit insert mode
inoremap jj <Esc>

" moving through buffers

" autoindent
filetype plugin indent on

" to scroll with mousewheel and click
set mouse=a

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
" set background=dark
" color gruvbox
colorscheme codedark
hi Normal ctermbg=None

" line numbers
" set number

let b:ale_linters = ['flake8', 'pyls']
let g:ale_completion_enabled = 1

let g:gruvbox_underline = 0

" leader+number to switch between splits
let i = 1
while i <= 9
    execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
        let i = i + 1
endwhile
