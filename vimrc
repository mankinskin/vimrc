" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

set encoding=utf-8
set fileencoding=utf-8
:filetype on
" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden			" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)
set number          " Show Line Numbers
set linebreak		" Avoid wrapping a line in the middle of a word
set wrap			" Enable line wrapping
set title 			" set the window title to reflect the file currnetly being edited
"set shiftround      " when shifting lines round the indention to the nearest multiple of 'shiftwidth'
set shiftwidth=4	" when shifting, indent using 4 spaces
set tabstop=4		" indent using 4 spaces
"set softtabstop=4   " tabs are 4 spaces
"set expandtab		" tabs are spaces
set cursorline      " highlight cursor line 
"set cursorcolumn    " highlight cursor column
set smarttab		" insert 'tabstop' number of spaces when pressing tab
set autoindent		" new lines inherit indention from previous lines

hi CursorLine cterm=NONE ctermbg=black 
hi LineNr ctermfg=grey

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set laststatus=2	" always show status line	
set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#CursorLine#
set statusline+=\ %F
set statusline+=%=
set statusline+=%#PmenuSel#
set statusline+=\ %y
set statusline+=\ %p%%
set statusline+=\ %l:%c


" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

