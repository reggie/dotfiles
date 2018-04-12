"Initialize vim-plug
call plug#begin('~/.config/nvim/plugged/')

" appearance
Plug 'nviennot/molokai'  " Molokai colorscheme
Plug 'ddollar/nerdcommenter'  " Code comment toggling
Plug 'ervandew/supertab'  " Tab completion
Plug 'airblade/vim-gitgutter'  " Vim diff in gutter
Plug 'elzr/vim-json'  " JSON syntax highlighting
Plug 'bronson/vim-trailing-whitespace'  " Highlights trailing whitespace
Plug 'vim-airline/vim-airline'  " VIM statusbar
Plug 'vim-airline/vim-airline-themes'  " Airline theme
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] } " JS syntax highlighting
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }  " JSX syntax highlighting
Plug 'w0rp/ale' " Asynchronous syntax highlighting

" Navigation
Plug 'scrooloose/nerdtree'  " Tree file explorer

call plug#end()

colorscheme molokai
let mapleader=","
set number
set bg=dark
set expandtab
set shiftwidth=2
set softtabstop=2

" JSX settings
let g:jsx_ext_required = 0

" Ale settings
let g:ale_set_quickfix = 1

" Airline settings
let g:airline_theme = 'molokai'
let g:airline_section_b = ''
let g:airline_section_z = airline#section#create(['%l', ':', '%c'])
let g:airline_right_sep = ''
let g:airline_left_sep = ''
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename

" Set NERDTree toggle binding
map <C-n> :NERDTreeToggle<CR>

" NERDTree settings
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Make NERDTree active on launch "
""""""""""""""""""""""""""""""""""
" Autolaunch when opening a file
autocmd vimenter * NERDTree | wincmd p
" Autolaunch when opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Close vim if NERDTree is the only active window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
