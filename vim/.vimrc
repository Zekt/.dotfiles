set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')

" Colorshemes
Plug 'Lucius'
Plug 'Zenburn'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'digitaltoad/vim-pug'

" Plug 'severin-lemaignan/vim-minimap'

" Syntax
Plug 'sudar/vim-arduino-syntax'
Plug 'peterhoeg/vim-qml'
Plug 'fatih/vim-go'
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'php.vim'
Plug 'othree/html5.vim'
Plug 'plasticboy/vim-markdown'
Plug 'neovimhaskell/haskell-vim'
Plug 'eagletmt/ghcmod-vim'

" Auto complete
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'Valloric/YouCompleteMe'
Plug 'davidhalter/jedi-vim'
Plug 'ervandew/supertab'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
" Indent
"Plug 'nathanaelkane/vim-indent-guides'

" Tools
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
" Plug 'euclio/vim-markdown-composer'
Plug 'suan/vim-instant-markdown'
" Plug 'Rykka/riv.vim'
" Plug 'Rykka/InstantRst'
Plug 'wakatime/vim-wakatime'
" Plug 'xuhdev/vim-latex-live-preview'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Twinside/vim-hoogle'

call plug#end()

color lucius
LuciusDark
set background=dark

let g:lucius_no_term_bg = 1

let g:minimap_highlight='Visual'

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

let g:vim_markdown_frontmatter = 1

" let vim_markdown_preview_github=1
let g:vim_markdown_preview_browser="chromium"

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
let g:syntastic_asm_checkers = ['nasm']
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <F10> :SyntasticToggleMode <bar> :w <CR>

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" autocmd VimEnter * NERDTree
map <C-n> :NERDTreeTabsToggle<CR>
let NERDTreeShowLineNumbers=1
let g:NERDTreeWinPos = "right"
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

autocmd filetype c,cpp nnoremap <F5> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype python nnoremap <F5> :w <bar> exec '!python '.shellescape('%')<CR>
autocmd filetype haskell nnoremap <F1> :w <bar> exec 'GhcModType'<CR>
autocmd filetype haskell nnoremap <F2> :w <bar> exec 'GhcModCheck'<CR>
autocmd filetype haskell nnoremap <F3> :w <bar> exec 'GhcModLint'<CR>
nnoremap <esc> :noh<return><esc>
autocmd filetype haskell nnoremap <esc> :noh <bar> GhcModTypeClear<return><esc>

let g:AutoClosePumvisible = {"ENTER": "<C-Y>", "ESC": "<ESC>"}

let g:livepreview_previewer = 'evince'

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

autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
autocmd Filetype html,javascript,json,jade,pug setlocal ts=2 sw=2 expandtab
autocmd Filetype python,haskell setlocal ts=4 sw=4 expandtab
