" Plugin loading. Toggle installation with :PlugInstall
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'ervandew/supertab'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'justinmk/vim-sneak'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'djoshea/vim-autoread'
Plug 'voldikss/vim-floaterm'

call plug#end()

let mapleader = " "

" NERDTREE
nmap <leader>e :NERDTreeToggle<cr>
" close nerdtree if it's the last open buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" relative line numbers
set number
set relativenumber

" toggle line numbers
nmap <leader>l :set relativenumber! nu!<cr>

" highlight the line that your cursor is on
set cursorline

" start scrolling down in last 10 lines so we always have some context
set scrolloff=10

" fzf
nmap <C-P> :GFiles<CR>
nmap <C-F> :Rg<CR>

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

" jk to exit insert mode
inoremap jk <Esc>

" moving through buffers

" autoindent
filetype plugin indent on

" to scroll with mousewheel and click
set mouse=a

" tabs should be spaces
set tabstop=4
set shiftwidth=4
set expandtab

" be able to move between splits with ctrl+vim keys
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
inoremap <C-J> <Esc><C-W><C-J>
inoremap <C-K> <Esc><C-W><C-K>
inoremap <C-L> <Esc><C-W><C-L>
inoremap <C-H> <Esc><C-W><C-H>

" tab forwrad and backwards
" nnoremap <Tab> >>_
" nnoremap <S-Tab> <<_    " Tab is the same as Ctrl+I which breaks jmp forward
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" color
let g:dracula_colorterm = 0
colorscheme dracula
" hi Normal ctermbg=None

" leader+number to switch between splits
let i = 1
while i <= 9
    execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
        let i = i + 1
endwhile

" vim sneak
let g:sneak#label = 1

" background colors for active vs inactive windows
hi ActiveWindow ctermbg=None
hi InactiveWindow ctermbg=236
set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow

" make vim splits maintain equal sizing even when minimize and maximized
autocmd VimResized * wincmd =

" floaterm
nnoremap <C-T> :FloatermShow<cr>
inoremap <C-T> <Esc>:FloatermShow<cr>
tnoremap <C-T> <C-\><C-N>:FloatermHide<cr>
nnoremap <leader>n :FloatermNew --height=1.0 --width=0.7 --autoclose=2<cr>
tnoremap <C-N> <C-\><C-N>:FloatermNext<cr>
