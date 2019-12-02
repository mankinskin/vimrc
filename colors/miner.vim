" Name:       Miner

" SETUP -----------------------------------------------------------------------

" Set background to dark
set background=dark
set termguicolors " true color support
syntax clear

" Reset syntax highlighting
hi clear

" Declare theme name
let g:colors_name='miner'

" COLORS ----------------------------------------------------------------------

" general
hi Normal guibg=#12120d guifg=#e4e4dc
hi NonText guibg=#090803 guifg=#71644A
hi NormalNC guibg=#0c0c09
hi Question guibg=#EEEEEE guifg=#111111
hi WarningMsg guibg=#EEAA33 guifg=#010101
hi ErrorMsg guibg=#CE2424 guifg=#EEEEEE
hi Comment guifg=#71644A
hi Type guifg=#617477
hi Constant guifg=#d3cebf
hi Identifier guifg=#B9A14B
hi Statement guifg=#d8651a
hi PreProc guifg=#457941
hi Special guifg=#6f9096
hi SpecialKey guibg=#009009 guifg=#6690d9
hi Whitespace guibg=#BB2424 guifg=#EEEEEE
hi link ExtraWhitespace Whitespace
hi Directory guifg=#5dc558
hi Search guibg=#000000 guifg=#EEAA33
hi IncSearch guibg=#000000 guifg=#EEAA33
hi Substitute guibg=#000000 guifg=#EEAA33
hi DiffAdd guifg=#367033
hi DiffDelete guifg=#BB2424
hi DiffChange guifg=#EEAA33
hi DiffText guifg=#71644A
hi VertSplit guibg=#000000 guifg=#111111
hi ColorColumn guibg=#000000 guifg=#111111
hi FoldColumn guibg=#000000 guifg=#111111
hi QuickFixLine guibg=#000000 guifg=#111111
hi Tooltip guibg=#000000 guifg=#111111
hi Scrollbar guibg=#000000 guifg=#111111
hi Menu guibg=#000000 guifg=#111111

" cursor
hi Cursor gui=reverse guibg=black guifg=black
hi CursorColumn guibg=#1A1A1A
hi CursorLine guibg=#1A1A1A
hi LineNr guifg=#555555 guibg=#111111
hi CursorLineNr gui=bold guibg=#000000 guifg=#CBCB7E
hi SignColumn guibg=#111111 guifg=#c6c1b2

hi Visual guibg=#222222 guifg=#EEEE77
hi VisualNOS guibg=#222222 guifg=#EE7777
hi MatchParen gui=bold guifg=#EEEEEE guibg=#555555

" spell check
"hi SpellBad gui=undercurl guisp=#BB2424 guifg=NONE guibg=NONE

" menu
hi Pmenu guibg=#111111 guifg=#999999
hi PmenuSel guibg=#444444 guifg=white
hi PmenuSbar guibg=#444444 guifg=white

" statusline
hi StatusLine guibg=#77EE77 guifg=#020202
hi StatusLineNC guibg=#444444 guifg=#020202

" tabs
hi TabLine guibg=#111111 guifg=#999999
hi TabLineFill guibg=#0F0F0F guifg=#111111
hi TabLineSel guifg=#77EE77

" modes
hi ModeMsg guibg=#111111 guifg=#CBCB7E
hi MsgArea guibg=#111111 guifg=#CBCB7E

" LINKING ---------------------------------------------------------------------

"hi!  link  VimCommentString  Comment

