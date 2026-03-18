" Name:         berkeley-light
" Description:  Light colorscheme inspired by shine, using Berkeley colors

set background=light

hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = 'berkeley-light'

let g:terminal_ansi_colors = [
      \ '#000000', '#B73A34', '#0A805D', '#FEB908',
      \ '#006ec3', '#5f00b9', '#006ec3', '#767676',
      \ '#000000', '#B73A34', '#0A805D', '#FEB908',
      \ '#006ec3', '#5f00b9', '#006ec3', '#767676'
      \ ]

hi! link CurSearch Search
hi! link CursorLineFold CursorLine
hi! link CursorLineSign CursorLine
hi! link EndOfBuffer NonText
hi! link ErrorMsg Error
hi! link Function Identifier
hi! link LineNrAbove LineNr
hi! link LineNrBelow LineNr
hi! link MessageWindow Pmenu
hi! link Operator Statement
hi! link PopupNotification Todo
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC
hi! link TabPanel Normal
hi! link TabPanelFill EndOfBuffer
hi! link Tag Special
hi! link Terminal Normal
hi! link Boolean Constant
hi! link Character Constant
hi! link Conditional Statement
hi! link Debug Special
hi! link Define PreProc
hi! link Delimiter Special
hi! link Exception Statement
hi! link Float Number
hi! link Include PreProc
hi! link Keyword Statement
hi! link Label Statement
hi! link Macro PreProc
hi! link Number Constant
hi! link PreCondit PreProc
hi! link Repeat Statement
hi! link SpecialComment Special
hi! link StorageClass Type
hi! link Structure Type
hi! link Typedef Type

hi Normal guifg=#000000 guibg=#FFFFFF guisp=NONE gui=NONE ctermfg=black ctermbg=white cterm=NONE term=NONE
hi ColorColumn guifg=#000000 guibg=#EBEBEB guisp=NONE gui=NONE ctermfg=black ctermbg=grey cterm=NONE term=reverse
hi Comment guifg=#9A9A9A guibg=NONE guisp=NONE gui=italic ctermfg=darkgrey ctermbg=NONE cterm=italic term=italic
hi Conceal guifg=#006ec3 guibg=NONE guisp=NONE gui=NONE ctermfg=blue ctermbg=NONE cterm=NONE term=NONE
hi Constant guifg=#E25600 guibg=NONE guisp=NONE gui=NONE ctermfg=darkyellow ctermbg=NONE cterm=NONE term=NONE
hi Cursor guifg=#FFFFFF guibg=#000000 guisp=NONE gui=NONE ctermfg=white ctermbg=black cterm=NONE term=reverse
hi CursorColumn guifg=NONE guibg=#EBEBEB guisp=NONE gui=NONE ctermfg=NONE ctermbg=grey cterm=NONE term=NONE
hi CursorLine guifg=NONE guibg=#EBEBEB guisp=NONE gui=NONE ctermfg=NONE ctermbg=grey cterm=NONE term=NONE
hi CursorLineNr guifg=#000000 guibg=#EBEBEB guisp=NONE gui=NONE ctermfg=black ctermbg=grey cterm=bold term=bold
hi DiffAdd guifg=#FFFFFF guibg=#0A805D guisp=NONE gui=NONE ctermfg=white ctermbg=darkgreen cterm=NONE term=reverse
hi DiffChange guifg=#000000 guibg=#FEB908 guisp=NONE gui=NONE ctermfg=black ctermbg=yellow cterm=NONE term=NONE
hi DiffDelete guifg=#FFFFFF guibg=#B73A34 guisp=NONE gui=NONE ctermfg=white ctermbg=darkred cterm=NONE term=reverse
hi DiffText guifg=#FFFFFF guibg=#006ec3 guisp=NONE gui=NONE ctermfg=white ctermbg=blue cterm=bold term=reverse
hi Directory guifg=#006ec3 guibg=NONE guisp=NONE gui=bold ctermfg=blue ctermbg=NONE cterm=bold term=NONE
hi Error guifg=#FFFFFF guibg=#B73A34 guisp=NONE gui=NONE ctermfg=white ctermbg=darkred cterm=NONE term=bold,reverse
hi FoldColumn guifg=#9A9A9A guibg=NONE guisp=NONE gui=NONE ctermfg=darkgrey ctermbg=NONE cterm=NONE term=NONE
hi Folded guifg=#006ec3 guibg=#EBEBEB guisp=NONE gui=NONE ctermfg=blue ctermbg=grey cterm=NONE term=NONE
hi Identifier guifg=#006ec3 guibg=NONE guisp=NONE gui=NONE ctermfg=blue ctermbg=NONE cterm=NONE term=NONE
hi Ignore guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE term=NONE
hi IncSearch guifg=#000000 guibg=#FEB908 guisp=NONE gui=NONE ctermfg=black ctermbg=yellow cterm=NONE term=bold,reverse,underline
hi LineNr guifg=#9A9A9A guibg=NONE guisp=NONE gui=NONE ctermfg=darkgrey ctermbg=NONE cterm=NONE term=NONE
hi MatchParen guifg=#000000 guibg=#FEB908 guisp=NONE gui=NONE ctermfg=black ctermbg=yellow cterm=NONE term=bold,underline
hi ModeMsg guifg=#000000 guibg=#FFFFFF guisp=NONE gui=NONE ctermfg=black ctermbg=white cterm=NONE term=bold
hi MoreMsg guifg=#0A805D guibg=#FFFFFF guisp=NONE gui=NONE ctermfg=darkgreen ctermbg=white cterm=NONE term=NONE
hi NonText guifg=#EBEBEB guibg=#FFFFFF guisp=NONE gui=NONE ctermfg=grey ctermbg=white cterm=NONE term=NONE
hi Number guifg=#E25600 guibg=NONE guisp=NONE gui=bold ctermfg=darkyellow ctermbg=NONE cterm=bold term=NONE
hi NormalFloat guifg=#000000 guibg=#FFFFFF guisp=NONE gui=NONE ctermfg=black ctermbg=white cterm=NONE term=NONE
hi FloatBorder guifg=#9A9A9A guibg=#FFFFFF guisp=NONE gui=NONE ctermfg=darkgrey ctermbg=white cterm=NONE term=NONE
hi Pmenu guifg=#000000 guibg=#EBEBEB guisp=NONE gui=NONE ctermfg=black ctermbg=grey cterm=NONE term=reverse
hi PmenuMatch guifg=#E25600 guibg=#EBEBEB guisp=NONE gui=NONE ctermfg=darkyellow ctermbg=grey cterm=NONE term=NONE
hi PmenuMatchSel guifg=#000000 guibg=#FEB908 guisp=NONE gui=NONE ctermfg=black ctermbg=yellow cterm=NONE term=NONE
hi PmenuSbar guifg=#FFFFFF guibg=#FFFFFF guisp=NONE gui=NONE ctermfg=white ctermbg=white cterm=NONE term=reverse
hi PmenuSel guifg=#000000 guibg=#FEB908 guisp=NONE gui=NONE ctermfg=black ctermbg=yellow cterm=NONE term=bold
hi PmenuThumb guifg=#9A9A9A guibg=#9A9A9A guisp=NONE gui=NONE ctermfg=darkgrey ctermbg=darkgrey cterm=NONE term=NONE
hi PreProc guifg=#5f00b9 guibg=NONE guisp=NONE gui=NONE ctermfg=magenta ctermbg=NONE cterm=NONE term=NONE
hi Question guifg=#E25600 guibg=NONE guisp=NONE gui=NONE ctermfg=darkyellow ctermbg=NONE cterm=NONE term=standout
hi QuickFixLine guifg=#000000 guibg=#FEB908 guisp=NONE gui=NONE ctermfg=black ctermbg=yellow cterm=NONE term=NONE
hi Search guifg=#FFFFFF guibg=#5f00b9 guisp=NONE gui=NONE ctermfg=white ctermbg=magenta cterm=NONE term=reverse
hi SignColumn guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE term=reverse
hi Special guifg=#E25600 guibg=NONE guisp=NONE gui=NONE ctermfg=darkyellow ctermbg=NONE cterm=NONE term=NONE
hi SpecialChar guifg=#006ec3 guibg=NONE guisp=NONE gui=NONE ctermfg=blue ctermbg=NONE cterm=NONE term=NONE
hi SpecialKey guifg=#006ec3 guibg=NONE guisp=NONE gui=NONE ctermfg=blue ctermbg=NONE cterm=NONE term=bold
hi SpellBad guifg=#B73A34 guibg=NONE guisp=#B73A34 gui=undercurl ctermfg=darkred ctermbg=NONE cterm=underline term=underline
hi SpellCap guifg=#0A805D guibg=NONE guisp=#0A805D gui=undercurl ctermfg=darkgreen ctermbg=NONE cterm=underline term=underline
hi SpellLocal guifg=#5f00b9 guibg=NONE guisp=#5f00b9 gui=undercurl ctermfg=magenta ctermbg=NONE cterm=underline term=underline
hi SpellRare guifg=#006ec3 guibg=NONE guisp=#006ec3 gui=undercurl ctermfg=blue ctermbg=NONE cterm=underline term=underline
hi Statement guifg=#0A805D guibg=NONE guisp=NONE gui=bold ctermfg=darkgreen ctermbg=NONE cterm=bold term=bold
hi StatusLine guifg=#FFFFFF guibg=#0A805D guisp=NONE gui=bold ctermfg=white ctermbg=darkgreen cterm=bold term=bold,reverse
hi StatusLineNC guifg=#000000 guibg=#EBEBEB guisp=NONE gui=NONE ctermfg=black ctermbg=grey cterm=NONE term=bold,underline
hi TabLine guifg=#000000 guibg=#EBEBEB guisp=NONE gui=underline ctermfg=black ctermbg=grey cterm=underline term=bold,underline
hi TabLineFill guifg=NONE guibg=NONE guisp=NONE gui=reverse ctermfg=NONE ctermbg=NONE cterm=reverse term=NONE
hi TabLineSel guifg=#FFFFFF guibg=#0A805D guisp=NONE gui=bold ctermfg=white ctermbg=darkgreen cterm=bold term=bold,reverse
hi Title guifg=#0A805D guibg=NONE guisp=NONE gui=bold ctermfg=darkgreen ctermbg=NONE cterm=bold term=NONE
hi TitleBar guifg=#000000 guibg=#EBEBEB guisp=NONE gui=NONE ctermfg=black ctermbg=white cterm=NONE term=NONE
hi TitleBarNC guifg=#9A9A9A guibg=#FFFFFF guisp=NONE gui=NONE ctermfg=darkgrey ctermbg=white cterm=NONE term=NONE
hi Todo guifg=#000000 guibg=#FEB908 guisp=NONE gui=NONE ctermfg=black ctermbg=yellow cterm=NONE term=bold,reverse
hi ToolbarButton guifg=NONE guibg=#EBEBEB guisp=NONE gui=bold ctermfg=NONE ctermbg=grey cterm=bold term=bold,reverse
hi ToolbarLine guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE term=reverse
hi Type guifg=#0A805D guibg=NONE guisp=NONE gui=bold ctermfg=darkgreen ctermbg=NONE cterm=bold term=NONE
hi Underlined guifg=#5f00b9 guibg=NONE guisp=NONE gui=underline ctermfg=magenta ctermbg=NONE cterm=underline term=underline
hi VertSplit guifg=#EBEBEB guibg=#EBEBEB guisp=NONE gui=NONE ctermfg=grey ctermbg=grey cterm=NONE term=NONE
hi Visual guifg=#000000 guibg=#FEB908 guisp=NONE gui=NONE ctermfg=black ctermbg=yellow cterm=NONE term=reverse
hi VisualNOS guifg=NONE guibg=NONE guisp=NONE gui=bold ctermfg=NONE ctermbg=NONE cterm=underline term=NONE
hi WarningMsg guifg=#E25600 guibg=#FFFFFF guisp=NONE gui=NONE ctermfg=darkyellow ctermbg=white cterm=NONE term=standout
hi WildMenu guifg=#000000 guibg=#FEB908 guisp=NONE gui=bold ctermfg=black ctermbg=yellow cterm=bold term=bold
hi WinSeparator guifg=#EBEBEB guibg=#EBEBEB guisp=NONE gui=NONE ctermfg=grey ctermbg=grey cterm=NONE term=NONE
hi lCursor guifg=#000000 guibg=#E25600 guisp=NONE gui=NONE ctermfg=black ctermbg=darkyellow cterm=NONE term=NONE

hi DiagnosticError guifg=#B73A34 guibg=NONE guisp=NONE gui=NONE ctermfg=darkred ctermbg=NONE cterm=NONE term=NONE
hi DiagnosticWarn guifg=#E25600 guibg=NONE guisp=NONE gui=NONE ctermfg=darkyellow ctermbg=NONE cterm=NONE term=NONE
hi DiagnosticInfo guifg=#006ec3 guibg=NONE guisp=NONE gui=NONE ctermfg=blue ctermbg=NONE cterm=NONE term=NONE
hi DiagnosticHint guifg=#0A805D guibg=NONE guisp=NONE gui=NONE ctermfg=darkgreen ctermbg=NONE cterm=NONE term=NONE
hi DiagnosticOk guifg=#0A805D guibg=NONE guisp=NONE gui=NONE ctermfg=darkgreen ctermbg=NONE cterm=NONE term=NONE
hi DiagnosticUnderlineError guifg=NONE guibg=NONE guisp=#B73A34 gui=undercurl ctermfg=NONE ctermbg=NONE cterm=underline term=underline
hi DiagnosticUnderlineWarn guifg=NONE guibg=NONE guisp=#E25600 gui=undercurl ctermfg=NONE ctermbg=NONE cterm=underline term=underline
hi DiagnosticUnderlineInfo guifg=NONE guibg=NONE guisp=#006ec3 gui=undercurl ctermfg=NONE ctermbg=NONE cterm=underline term=underline
hi DiagnosticUnderlineHint guifg=NONE guibg=NONE guisp=#0A805D gui=undercurl ctermfg=NONE ctermbg=NONE cterm=underline term=underline
