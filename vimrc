" prevent defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

""""""""""""""""""""""""""""""
""" Start Vundle Configuration

" required for Vundle
filetype off
set nocompatible

" set runtime path to include vundle
set rtp+=~/.vim/bundle/Vundle.Vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.Vim'

" Utility
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'jewes/Conque-shell'

" Generic Programming Support

" Markdown / Writing

" Git Support

" Theme / Interface
Plugin 'ryanoasis/vim-devicons'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sjl/badwolf'

call vundle#end()
filetype plugin indent on
""" End Vundle Configuration
"""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""
"" Configuration Section

"" Utility Plugins

" Nerdtree
map <Tab> :NERDTreeToggle<CR>

" jump to the last position when reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

syntax on
set background=dark
set encoding=utf-8
set fileencoding=utf-8

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

" when shifting, indent using 4 spaces
set shiftwidth=4

" indent using 4 spaces
set tabstop=8

" tabs are 4 spaces
set softtabstop=4

" tabs are spaces
set expandtab

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
set wildmenu
set completeopt=longest,menuone

" For filetypes c, cpp, py, pl, pm, rb, js and tcl
" highlight extra whitespaces as red
autocmd FileType c,cpp,python,perl,ruby,javascript,tcl hi ExtraWhitespace ctermbg=red guibg=red
autocmd FileType c,cpp,python,perl,ruby,javascript,tcl match ExtraWhitespace /\s\+$/
" highlight tabs as dots
autocmd FileType c,cpp,python,perl,ruby,javascript,tcl set list listchars=tab:··
" set textwidth to 80
autocmd FileType c,cpp,python,perl,ruby,javascript,tcl set tw=80

" set cursor line background black
hi CursorLine cterm=NONE ctermbg=Black
hi LineNr ctermfg=173

" set menu colors
hi Pmenu ctermbg=black ctermfg=grey
hi PmenuSel ctermbg=white ctermfg=black
" set status line
" always show status line
set laststatus=2	

map <C-s> :w<CR> 
map <:-Q> :q

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
    source /etc/vim/vimrc.local
endif
