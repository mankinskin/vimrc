" prevent defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible


set nocompatible
set encoding=utf-8
set fileencoding=utf-8
""""""""""""""""""""""""""""""
""" Start vim-plug Configuration
" install vim-plug if needed
if has('nvim')
  if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
else
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
endif

call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/vim-plug'

" Utility
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'Valloric/YouCompleteMe', {'do': './install.sh --clang-completer --system-libclang'}
Plug 'vim-syntastic/syntastic'
" Plug 'ervandew/supertab'	" replaced by YouCompleteMe
" Plug 'jewes/Conque-shell'

" Git Support
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-fugitive'

" Theme / Interface
Plug 'junegunn/goyo.vim'
"Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'fenetikm/falcon'
" Plug 'sjl/badwolf'
" Plug 'KKPMW/sacredforest-vim'
Plug 'morhetz/gruvbox'
" Plug 'xero/sourcerer.vim'

call plug#end()
""" End vim-plug Configuration
"""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""
"" Configuration Section
" Themes / colorschemes
set background=dark
syntax on
" set termguicolors	" true color support
" sourcerer
" colorscheme sourcerer

" gruvbox
colorscheme gruvbox
let g:gruvbox_italic=1	" enable italics
let g:gruvbox_italize_comments=0
let g:gruvbox_color_column ='bg2'
let g:gruvbox_contrast_dark='soft'
let g:gruvbox_improved_strings=1

" Falcon
" set termguicolors
" colorscheme falcon
" let g:falcon_airline=1
" let g:airline_theme = 'falcon'

" Badwolf color scheme
" colorscheme badwolf

" sacred forest color scheme
" colorscheme sacredforest
" set termguicolors

" You Complete Me
let g:ycm_add_preview_to_completeopt = 0

"" Utility Plugins

" Nerdtree
map <Tab> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Tagbar
map<C-k> :TagbarToggle<CR>

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
set completeopt=longest,menuone
set complete=.,w,b,i,d,t

" For filetypes c, cpp, py, pl, pm, rb, js and tcl
" highlight extra whitespaces as red
autocmd FileType java,c,cpp,python,perl,ruby,javascript,tcl,haskell hi ExtraWhitespace ctermbg=red guibg=red
autocmd FileType java,c,cpp,python,perl,ruby,javascript,tcl,haskell match ExtraWhitespace /\s\+$/
" set textwidth to 80
autocmd FileType java,c,cpp,python,perl,ruby,javascript,tcl,haskell set tw=80
" expand tabs for .hs files
autocmd FileType java,c,cpp,python,perl,ruby,javascript,tcl,haskell set softtabstop=4
autocmd FileType java,c,cpp,python,perl,ruby,javascript,tcl,haskell set tabstop=4
autocmd FileType java,c,cpp,python,perl,ruby,javascript,tcl,haskell set expandtab
" highlight tabs as dots
autocmd FileType java,c,cpp,python,perl,ruby,javascript,tcl,haskell set list listchars=tab:··

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
map <F7> :!make clean<CR>
map <F8> :!make all -j<CR>
map <F9> :!make run -j<CR>

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
    source /etc/vim/vimrc.local
endif
