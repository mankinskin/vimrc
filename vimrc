" prevent defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible


set background=dark
set encoding=utf-8
set fileencoding=utf-8
set nocompatible
syntax on

""""""""""""""""""""""""""""""
""" Start vim-plug Configuration
" required for vim-plug
filetype off

" install vim-plug if needed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/vim-plug'

" Utility
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'Valloric/YouCompleteMe', {'do': './install.sh --clang-completer --system-libclang'}
"Plug 'jewes/Conque-shell'
" Plug 'ervandew/supertab'	" replaced by YouCompleteMe
Plug 'tpope/vim-fugitive'
Plug 'fenetikm/falcon'
Plug 'sjl/badwolf'
Plug 'KKPMW/sacredforest-vim'
Plug 'vim-syntastic/syntastic'

" Generic Programming Support

" Markdown / Writing

" Git Support
Plug 'tpope/vim-fugitive'

" Theme / Interface
Plug 'junegunn/goyo.vim'
"Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'sjl/badwolf'

call plug#end()
filetype plugin indent on
""" End vim-plug Configuration
"""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""
"" Configuration Section
" You Complete Me
let g:ycm_add_preview_to_completeopt = 0

"" Utility Plugins

" Nerdtree
map <Tab> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Tagbar
map<C-k> :TagbarToggle<CR>

" Falcon color scheme
" set termguicolors
" colorscheme falcon
" let g:falcon_airline=1
" let g:airline_theme = 'falcon'

" Badwolf color scheme
" colorscheme badwolf

" sacred forest color scheme
" colorscheme sacredforest
" set termguicolors

""""""""""""""""""""""""""""""

" jump to the last position when reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set backspace=indent,eol,start
" Show (partial) command in status line.
set showcmd

" Show matching brackets
set showmatch

" Do case insensitive matching
" set ignorecase
"
" Do smart case matching
"set smartcase
"
" Incremental search
set incsearch

" Automatically save before commands like :next and :make
"set autowrite

" Hide buffers when they are abandoned
"set hidden

" Enable mouse usage (all modes)
set mouse=a

" Show Line Numbers
set number

" Avoid wrapping a line in the middle of a word
set linebreak

" Enable line wrapping
"set wrap

" set the window title to reflect the file currently being edited
set title

" when shifting lines round the indention to the nearest multiple of 'shiftwidth'
set shiftround

" when shifting, indent using x spaces
set shiftwidth=2

" indent using x spaces
set tabstop=4

" tabs are x spaces
set softtabstop=2

" tabs are spaces
" set expandtab

" highlight cursor line
set cursorline

" highlight cursor column
"set cursorcolumn

" insert 'tabstop' number of spaces when pressing tab
set smarttab

" new lines inherit indention from previous lines
set autoindent

set lazyredraw
"set foldenable
"set foldlevelstart=10
"set foldnestmax=10
set wildmode=longest,full
set completeopt=longest,menuone,preview
set complete=.,w,b,i,d,t

" For filetypes c, cpp, py, pl, pm, rb, js and tcl
" highlight extra whitespaces as red
autocmd FileType c,cpp,python,perl,ruby,javascript,tcl hi ExtraWhitespace ctermbg=red guibg=red
autocmd FileType c,cpp,python,perl,ruby,javascript,tcl match ExtraWhitespace /\s\+$/
" highlight tabs as dots
" autocmd FileType c,cpp,python,perl,ruby,javascript,tcl set list listchars=tab:··
" set textwidth to 80
autocmd FileType c,cpp,python,perl,ruby,javascript,tcl set tw=80

" set cursor line background black
hi CursorLine cterm=NONE ctermbg=black
hi LineNr ctermfg=173

" set menu colors
hi Pmenu ctermbg=darkgrey ctermfg=white
hi PmenuSel ctermbg=143 ctermfg=black
" set status line
" always show status line
set laststatus=2

map <C-s> :w<CR>
map <:-Q> :q

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
    source /etc/vim/vimrc.local
endif
