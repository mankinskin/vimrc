set nocompatible

"" vim-plug section
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
""""" PLUG CONFIG
call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/vim-plug'

Plug 'octol/vim-cpp-enhanced-highlight'
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1


Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "<c-n>"

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
let g:go_version_warning = 0

Plug 'mankinskin/vim-fish'

Plug 'junegunn/fzf'

Plug 'ap/vim-css-color'

Plug 'rust-lang/rust.vim'

Plug 'racer-rust/vim-racer'
let g:racer_cmd = "/home/linusb/.cargo/bin/racer"
let g:racer_experimental_completer = 1

"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'sebastianmarkow/deoplete-rust'
"let g:deoplete#enable_at_startup = 1
"let g:deoplete#sources#rust#racer_binary='$HOME/.cargo/bin/racer'
"let g:deoplete#sources#rust#rust_source_path='$HOME/.rustup/lib/rustlib/src/rust/src'

"Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'prabirshrestha/asyncomplete-lsp.vim'

"Plug 'vim-syntastic/syntastic'
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0
"let g:syntastic_rust_checkers = ["cargo"]
"let g:autoclose_on = 0

""""" THEMES
Plug 'morhetz/gruvbox'
"let g:gruvbox_italic=1 " enable italics
"let g:gruvbox_italize_comments=0
"let g:gruvbox_color_column ='bg2'
"let g:gruvbox_contrast_dark='soft'
"let g:gruvbox_improved_strings=1
"Plug 'Jorengarenar/vim-darkness'
"Plug 'fenetikm/falcon'
"let g:falcon_airline=1
"let g:airline_theme = 'falcon'
"Plug 'sjl/badwolf'
"Plug 'KKPMW/sacredforest-vim'
"Plug 'xero/sourcerer.vim'
"Plug 'AlessandroYorba/Alduin'
"let g:alduin_Shout_Dragon_Aspect = 1 " almost black
"let g:alduin_Shout_Become_Ethereal = 1 " black
"let g:alduin_Shout_Fire_Breath = 1 " dark red HL
"Plug 'AlessandroYorba/Arcadia'
"let g:arcadia_Sunset = 1
"let g:arcadia_Twilight = 1
"let g:arcadia_Midnight = 1
"let g:arcadia_Pitch = 1
"Plug 'junegunn/seoul256.vim'

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

""""" UNUNSED PLUGS

"Plug 'terryma/vim-smooth-scroll'
"let scrollspeed=2
"nnoremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, scrollspeed)<CR>
"nnoremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, scrollspeed)<CR>
"nnoremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, scrollspeed*2)<CR>
"nnoremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, scrollspeed*2)<CR>
"inoremap <silent> <c-u> <ESC>:call smooth_scroll#up(&scroll, 0, scrollspeed)<CR>i
"inoremap <silent> <c-d> <ESC>:call smooth_scroll#down(&scroll, 0, scrollspeed)<CR>i
"inoremap <silent> <c-b> <ESC>:call smooth_scroll#up(&scroll*2, 0, scrollspeed*2)<CR>i
"inoremap <silent> <c-f> <ESC>:call smooth_scroll#down(&scroll*2, 0, scrollspeed*2)<CR>i

"Plug 'MaskRay/ccls'

"Plug 'dense-analysis/ale'

"Plug 'ryanoasis/vim-devicons'

"Plug 'Yggdroot/indentLine'
"let g:indentLine_char = '│'

"Plug 'ctrlpvim/ctrlp.vim'

"Plug 'lervag/vimtex'
"let g:vimtex_compiler_progname = 'nvr'

" You Complete Me
"Plug 'Valloric/YouCompleteMe', {'do': './install.py --all --clang-completer --system-libclang --rust-completer --java-completer'}
"let g:ycm_add_preview_to_completeopt = 0
"let g:ycm_rust_src_path = '~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust'

"Plug 'vim-scripts/gtags.vim'

"Plug 'tpope/vim-commentary'

call plug#end()

""""" SETTINGS set

set background=dark
set backspace=indent,eol,start

" spell checking
" set spell spelllang=en_us

" Show (partial) command in status line.
set showcmd

" Show matching brackets
set showmatch

" Do case insensitive matching
set ignorecase

" Do smart case matching
set smartcase

" Incremental search
set incsearch

" Automatically write before commands like :next and :make
"set autowrite

" Hide buffers when they are abandoned
" set hidden

" Enable mouse usage (all modes)
set mouse=a

" Show Line Numbers
set number

" Avoid wrapping a line in the middle of a word
set linebreak

" Enable line wrapping
set wrap

" set the window title to reflect the file currently being edited
set title

" when shifting lines round the indention to the nearest multiple of 'shiftwidth'
"set shiftround

" when shifting, indent using x spaces
set shiftwidth=2

" tabs are x spaces
set softtabstop=2

" indent using x spaces
set tabstop=2

" tabs are spaces
set expandtab

" insert 'tabstop' number of spaces when pressing tab
set smarttab

" new lines inherit indention from previous lines
set autoindent

set lazyredraw

"set foldenable
"set foldlevelstart=10
"set foldnestmax=10

" scroll n lines
"set scroll=30

set scrolloff=16

" set textwidth to 80
set tw=80

" add subdirectories of cwd to path
set path+=**

let g:netrw_preview = 1

set wildmenu
set wildmode=longest,full
set completeopt=longest,menuone
set complete=.,w,b,i,d,t

set conceallevel=0
set exrc " enable external rc files
set secure
set iskeyword-=/   " treat / as word separator
set iskeyword-=_   " treat _ as word separator

set encoding=utf-8
set fileencoding=utf-8
filetype plugin on

set showmatch
" set status line
" always show status line
set laststatus=2

" always use system clipboard
set clipboard=unnamedplus

set autoread


""""" AUTO COMMANDS autocmd, au
" jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

au BufReadPost *.md setlocal filetype=markdown
au BufReadPost *.rs setlocal filetype=rust
au BufReadPost *.go setlocal filetype=go
au BufReadPost *.vim setlocal filetype=vim
au BufReadPost *.fish setlocal filetype=fish

" automatically update rusty-tags
"autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.wvi
"autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir" . expand('%:p:h') . "&" | redraw!
augroup reload_vimrc
  autocmd!
autocmd BufWritePost *.vim,vimrc,$MYVIMRC ++once silent! source $MYVIMRC | e
augroup END

au FileType rust,java,c,cpp,python,perl,ruby,javascript,tcl,haskell,vim,fish,go match ExtraWhitespace /\s\+$/
au FileType rust,java,c,cpp,python,perl,ruby,javascript,tcl,haskell,vim,fish set list listchars=tab:··
au FileType go set expandtab!

" fix garbage characters (caused by terminal response)
au VimEnter * redraw!

if executable('rls')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif

""""" COMMAND REMAPS map noremap nnoremap

map <C-s> :w<CR>
map <:-Q> :q
map <F7> :!make clean<CR>
map <F8> :!make all -j<CR>
map <F9> :!make run -j<CR>

noremap <C-j> 4j
noremap <C-k> 4k

" command remaps (! for force)
command! W w
command! Q q
command! Qa qa
command! QA qa
command! Wq wq
command! WQ wq
command! Wa wa
command! WA wa
command! Wqa wqa
command! WQa wqa
command! WQA wqa
command! E Explore


" NVIM Config
tnoremap <Esc> <C-\><C-n> " exit terminal mode with ESC
"nnoremap <silent> <C-space> :split term://bash<CR>
" Toggle 'default' terminal
nnoremap <silent> <Tab> :call ChooseTerm("term-slider", 1)<CR>

"colorscheme darkness
"colorscheme gruvbox
"colorscheme falcon
"colorscheme badwolf
"colorscheme sacredforest
"colorscheme sourcerer
"colorscheme alduin
"colorscheme arcadia
"colorscheme seoul256

" highlight cursor line
set cursorline

" highlight cursor column
set cursorcolumn

source ~/.vim/colors/miner.vim

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
  let firstline = 0 " first line of file
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
nnoremap <silent> <C-k> :call SmoothScroll(1, 4)<Enter>
nnoremap <silent> <C-j> :call SmoothScroll(0, 4)<Enter>
inoremap <silent> <C-U> <Esc>:call SmoothScroll(1, &scroll)<Enter>i
inoremap <silent> <C-D> <Esc>:call SmoothScroll(0, &scroll)<Enter>i
