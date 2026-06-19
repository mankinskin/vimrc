set nocompatible

let s:is_nvim = has('nvim')
let s:plug_home = expand(s:is_nvim ? stdpath('data') . '/site' : '~/.vim')
let s:plug_file = s:plug_home . '/autoload/plug.vim'
let s:plugged_dir = expand(s:is_nvim ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Plugin bootstrap
if empty(glob(s:plug_file)) && executable('curl')
  silent execute '!curl -fLo ' . shellescape(s:plug_file) . ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  augroup plug_bootstrap
    autocmd!
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  augroup END
endif

" Plugin configuration
if filereadable(s:plug_file)
  call plug#begin(s:plugged_dir)
  Plug 'junegunn/vim-plug'
  Plug 'octol/vim-cpp-enhanced-highlight'
  Plug 'ervandew/supertab'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'mankinskin/vim-fish'
  Plug 'junegunn/fzf'
  Plug 'ap/vim-css-color'
  Plug 'rust-lang/rust.vim'
  Plug 'racer-rust/vim-racer'

  " Optional plugins kept here for reference.
  " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  " Plug 'sebastianmarkow/deoplete-rust'
  " Plug 'prabirshrestha/async.vim'
  " Plug 'prabirshrestha/vim-lsp'
  " Plug 'prabirshrestha/asyncomplete.vim'
  " Plug 'prabirshrestha/asyncomplete-lsp.vim'
  " Plug 'vim-syntastic/syntastic'
  " Plug 'terryma/vim-smooth-scroll'
  " Plug 'MaskRay/ccls'
  " Plug 'dense-analysis/ale'
  " Plug 'ryanoasis/vim-devicons'
  " Plug 'Yggdroot/indentLine'
  " Plug 'ctrlpvim/ctrlp.vim'
  " Plug 'lervag/vimtex'
  " Plug 'Valloric/YouCompleteMe', {'do': './install.py --all --clang-completer --system-libclang --rust-completer --java-completer'}
  " Plug 'vim-scripts/gtags.vim'
  " Plug 'tpope/vim-commentary'
  " Plug 'morhetz/gruvbox'
  " Plug 'Jorengarenar/vim-darkness'
  " Plug 'fenetikm/falcon'
  " Plug 'sjl/badwolf'
  " Plug 'KKPMW/sacredforest-vim'
  " Plug 'xero/sourcerer.vim'
  " Plug 'AlessandroYorba/Alduin'
  " Plug 'AlessandroYorba/Arcadia'
  " Plug 'junegunn/seoul256.vim'
  call plug#end()
endif

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:go_version_warning = 0
let g:racer_cmd = '/home/linusb/.cargo/bin/racer'
let g:racer_experimental_completer = 1
let g:netrw_preview = 1

" Core editing behavior
set background=dark
set encoding=utf-8
set fileencoding=utf-8
set backspace=indent,eol,start
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set smarttab
set tw=80
set path+=**
set autoread
set hidden
set lazyredraw
set mouse=a
set title
set linebreak
set wrap
set scrolloff=16
set cursorline
set cursorcolumn

" Search and completion
set ignorecase
set smartcase
set incsearch
set wildmenu
set wildmode=longest,full
set completeopt=longest,menuone
set complete=.,w,b,i,d,t
set conceallevel=0

" UI helpers
set number
set showcmd
set showmatch
set laststatus=2

" Local overrides are allowed, but sandboxed.
set exrc
set secure
set iskeyword-=/
set iskeyword-=_

if has('syntax')
  syntax enable
endif
filetype plugin indent on

" Prefer the system clipboard when supported.
if has('clipboard')
  if exists('&clipboard') && stridx(&clipboard, 'unnamedplus') < 0
    if has('unnamedplus')
      set clipboard+=unnamedplus
    elseif has('unnamed')
      set clipboard+=unnamed
    endif
  endif
endif

" Autocommands

augroup user_restore_cursor
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line('$') | execute "normal! g'\"" | endif
augroup END

augroup reload_vimrc
  autocmd!
  autocmd BufWritePost *.vim,vimrc,$MYVIMRC silent! source $MYVIMRC | edit
augroup END

augroup user_whitespace
  autocmd!
  autocmd FileType rust,java,c,cpp,python,perl,ruby,javascript,tcl,haskell,vim,fish,go match ExtraWhitespace /\s\+$/
  autocmd FileType rust,java,c,cpp,python,perl,ruby,javascript,tcl,haskell,vim,fish setlocal list listchars=tab:··
  autocmd FileType go setlocal noexpandtab
augroup END

augroup user_startup
  autocmd!
  autocmd VimEnter * redraw!
augroup END

if exists('*lsp#register_server') && executable('rls')
  augroup rust_lsp
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
          \ 'name': 'rls',
          \ 'cmd': {server_info -> ['rustup', 'run', 'nightly', 'rls']},
          \ 'whitelist': ['rust'],
          \ })
  augroup END
endif

" Commands and mappings
nnoremap <C-s> :write<CR>
nnoremap <F7> :!make clean<CR>
nnoremap <F8> :!make all -j<CR>
nnoremap <F9> :!make run -j<CR>

command! W write
command! Q quit
command! Qa qall
command! QA qall
command! Wq wq
command! WQ wq
command! Wa wall
command! WA wall
command! Wqa wqall
command! WQa wqall
command! WQA wqall
command! E Explore

if s:is_nvim
  tnoremap <Esc> <C-\><C-n>
  nnoremap <silent> <Tab> :call ChooseTerm('term-slider', 1)<CR>
endif

silent! colorscheme miner

function! ChooseTerm(termname, slider)
  let pane = bufwinnr(a:termname)
  let buf = bufexists(a:termname)
  let split_cmd = "below split"
  if pane > 0 " pane is visible
    if a:slider > 0
      :exe pane . "wincmd c"
    else
      :exe "e #"
    endif
  elseif buf > 0 " buffer is not in pane
    if a:slider
      :exe split_cmd
    endif
    :exe "buffer " . a:termname
  else " buffer is not loaded, create
    if a:slider
      :exe split_cmd
    endif
    :terminal
    :exe "f " a:termname
  endif
endfunction

" smooth scrolling
function! SmoothScroll(up, s)
  let screenmove="" " command to move screen
  let cursormove="" " command to move cursor
  if a:up
      let screenmove="normal \<C-y>"
      let cursormove="normal k"
  else
      let screenmove="normal \<C-e>"
      let cursormove="normal j"
  endif
  let s = a:s " total lines to scroll
  let topline = line("w0") " the first line on the screen
  let cursorline = line(".") " the cursor line
  let bottomline = line("w$") " the bottom line on the screen
  let lastline = line("$") " last line of file
  let topoff = topline + &scrolloff " top line that causes auto scroll
  let bottomoff = bottomline - &scrolloff " top line that causes auto scroll

  let cursorscroll = s " lines to scroll the cursor
  let screenscroll = s " lines to scroll the screen

  let screenskip = 0 " lines to skip screen scrolling
  if a:up
    " scrolling up
    let screenscroll = min([s, topline])
    let cursorscroll = min([s, cursorline])
  else
    " scrolling down
    let cursorscroll = min([s, lastline - cursorline])
    if cursorline < topoff
      let screenskip = topoff - cursorline
    endif
  endif
  " start scrolling!
  function! Time(x, s) " waiting time for smoothing
    let x = a:x
    let s = a:s
    let T=3 " maximum sleep ms for smoothing
    let m=s/3 " number of lines for which smoothing is applied
    return T*(x-m)*(x-(s-m))/(m*(s-m))
  endfunction

  let x=0   " counts from 0 to screenscroll
  while (x < screenscroll) || (x < cursorscroll)
    let time=Time(x,s)
    if time > 0
      exec "sleep ".time."m"
      redraw
    end
    if x < cursorscroll
      exec cursormove
    endif
    if x < screenscroll && x >= screenskip
      exec screenmove
    endif
    let x+=1
  endwhile
endfunction
nnoremap <silent> <C-U> :call SmoothScroll(1, &scroll)<Enter>
nnoremap <silent> <C-D> :call SmoothScroll(0, &scroll)<Enter>
nnoremap <C-k> 4k
nnoremap <C-j> 4j
inoremap <silent> <C-U> <Esc>:call SmoothScroll(1, &scroll)<Enter>i
inoremap <silent> <C-D> <Esc>:call SmoothScroll(0, &scroll)<Enter>i
