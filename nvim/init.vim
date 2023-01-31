set clipboard+=unnamedplus
set nocompatible
set noshowmode
set laststatus=2
filetype plugin off

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'gruvbox-community/gruvbox'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-lua/plenary.nvim'

call plug#end()

runtime nerdtree.vim
runtime coc.lua
runtime line.vim
runtime lua/user/plugins.lua
runtime ./icon.lua

""apparence
set bg=dark
colorscheme gruvbox
set showmatch
set nohlsearch

set hlsearch!
set incsearch

syntax on

set mouse=a
set wildmode=longest,list
filetype plugin indent on
filetype plugin on

set cursorline
set ttyfast

set cc=80
set nu

set tabstop=4 softtabstop=4 shiftwidth=4
set autoindent

set noswapfile
set backupdir=~/.cache/vim/


" nvim command
nnoremap <S-T> :tabnew<CR>
nnoremap <S-Q> :q<CR>

nnoremap <C-l> :tabnext<CR>
nnoremap <C-h> :tabprevious<CR>

nnoremap <A-k> :wincmd k<CR>
nnoremap <A-j> :wincmd j<CR>
nnoremap <A-h> :wincmd h<CR>
nnoremap <A-l> :wincmd l<CR>

tnoremap <ESC> <C-\><C-n>

inoremap {<cr> {<cr>}<ESC>kA<CR>
inoremap { {}<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i

" NERDtree command
nnoremap <n> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>.
nnoremap <S-N> :NERDTreeMirror<CR>:NERDTreeFocus<CR>

nnoremap <F3>  :set hlsearch!<CR>

" autocmd NERDTree


" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif


" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif


" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif


" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif


" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
