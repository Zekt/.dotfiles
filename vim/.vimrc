set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')

" let Vundle manage Vundle, required
Plug 'gmarik/Vundle.vim'

" Colorshemes
Plug 'Lucius'
Plug 'Zenburn'

" Syntax
Plug 'sudar/vim-arduino-syntax'
Plug 'peterhoeg/vim-qml'
Plug 'fatih/vim-go'
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'

" Auto complete
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'Valloric/YouCompleteMe'
Plug 'davidhalter/jedi-vim'
Plug 'ervandew/supertab'
Plug 'scrooloose/syntastic'
" Indent
"Plug 'nathanaelkane/vim-indent-guides'

" Tools
Plug 'scrooloose/nerdtree'
Plug 'euclio/vim-markdown-composer'
Plug 'bling/vim-airline'

call plug#end()

color lucius
LuciusDark
set background=dark

autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

let g:lucius_no_term_bg = 1

let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
" set ts=4 sw=4 noet
let g:indent_guides_start_level = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=NONE ctermbg=NONE
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333333 ctermbg=237

let g:pydiction_location = '/home/vik/.vim/bundle/Pydiction/complete-dict'
let g:jedi#completions_enabled = 1
let g:jedi#force_py_version = 3

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1


" autocmd VimEnter * NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:markdown_composer_browser = "firefox"

autocmd filetype c,cpp nnoremap <F5> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype python nnoremap <F5> :w <bar> exec '!python '.shellescape('%')<CR>

let g:AutoClosePumvisible = {"ENTER": "<C-Y>", "ESC": "<ESC>"}

sy on
set number
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

