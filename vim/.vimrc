set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')

" Colorshemes
Plug 'vim-scripts/Lucius'
Plug 'vim-scripts/Zenburn'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'digitaltoad/vim-pug'

" Plug 'severin-lemaignan/vim-minimap'

" Syntax
" Plug 'sudar/vim-arduino-syntax'
" Plug 'peterhoeg/vim-qml'
Plug 'fatih/vim-go'
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
" Plug 'vim-scripts/php.vim'
Plug 'othree/html5.vim'
Plug 'plasticboy/vim-markdown'
Plug 'neovimhaskell/haskell-vim'
" Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/neco-ghc'
Plug 'purescript-contrib/purescript-vim'
Plug 'vmchale/dhall-vim'

" Auto complete
" Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'Valloric/YouCompleteMe'
" Plug 'davidhalter/jedi-vim'
" Plug 'ervandew/supertab'
" Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
" Plug 'tpope/vim-fugitive'
" Indent
Plug 'nathanaelkane/vim-indent-guides'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" Tools
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
" Plug 'euclio/vim-markdown-composer'
" Plug 'suan/vim-instant-markdown'
" Plug 'Rykka/riv.vim'
" Plug 'Rykka/InstantRst'
Plug 'wakatime/vim-wakatime'
" Plug 'xuhdev/vim-latex-live-preview'
" Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Twinside/vim-hoogle'
Plug 'derekelkins/agda-vim'

call plug#end()

color lucius
LuciusDark
set background=dark

let g:lucius_no_term_bg = 1

let g:minimap_highlight='Visual'

sy on
set number
set relativenumber
au FocusLost * :set norelativenumber
au FocusGained * :set relativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
set cursorline
set ruler
set tabstop=4
set shiftwidth=4
set smarttab
set ai
set si
set wrap
set t_Co=256
set encoding=utf8
set mouse=a
set clipboard+=unnamedplus
set splitbelow
set pumheight=10
set lazyredraw

set wildmenu
set incsearch
set hlsearch
set foldenable
set foldmethod=indent

" move vertically by visual line
nnoremap j gj
nnoremap k gk

cmap w!! w !sudo tee > /dev/null %

au BufNewFile,BufRead *.agda setf agda
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
autocmd Filetype html,javascript,json,jade,pug setlocal ts=2 sw=2 expandtab
autocmd Filetype python,haskell setlocal ts=4 sw=4 expandtab

let g:deoplete#enable_at_startup = 1
inoremap <silent><expr> <TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
