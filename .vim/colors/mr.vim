" Name:         mr
" Theme:        Mirage Raceway

set background=light

hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = 'mr'

let s:white = '#F7F4EE'
let s:black = '#1E1B18'
let s:green = '#0A7F5D'
let s:blue = '#006EC3'
let s:orange = '#CB3F00'
let s:red = '#B73A34'
let g:terminal_ansi_colors = [
      \ s:black, s:red, s:green, s:orange,
      \ s:blue, s:red, s:blue, s:white,
      \ s:black, s:red, s:green, s:orange,
      \ s:blue, s:red, s:blue, s:white
      \ ]

function! s:HL(group, guifg, guibg, gui, ctermfg, ctermbg, cterm, ...) abort
  let l:guisp = a:0 ? a:1 : 'NONE'
  execute 'hi' a:group
        \ 'guifg=' . a:guifg
        \ 'guibg=' . a:guibg
        \ 'guisp=' . l:guisp
        \ 'gui=' . a:gui
        \ 'ctermfg=' . a:ctermfg
        \ 'ctermbg=' . a:ctermbg
        \ 'cterm=' . a:cterm
        \ 'term=' . a:cterm
endfunction

hi! link CurSearch Search
hi! link CursorLineFold CursorLine
hi! link CursorLineSign CursorLine
hi! link EndOfBuffer NonText
hi! link ErrorMsg Error
hi! link Function Identifier
hi! link LineNrAbove LineNr
hi! link LineNrBelow LineNr
hi! link MessageWindow Pmenu
hi! link NormalNC Normal
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
hi! link String Constant
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
hi! link StorageClass Type
hi! link Structure Type
hi! link Typedef Type

call s:HL('Normal', s:black, s:white, 'NONE', 'black', 'white', 'NONE')
call s:HL('ColorColumn', s:black, s:white, 'underline', 'black', 'white', 'underline')
call s:HL('Comment', s:black, 'NONE', 'italic', 'black', 'NONE', 'italic')
call s:HL('Conceal', s:blue, 'NONE', 'NONE', 'blue', 'NONE', 'NONE')
call s:HL('Constant', s:orange, 'NONE', 'italic', 'darkyellow', 'NONE', 'italic')
call s:HL('Cursor', s:white, s:black, 'NONE', 'white', 'black', 'NONE')
call s:HL('CursorColumn', s:black, 'NONE', 'underline', 'black', 'NONE', 'underline')
call s:HL('CursorLine', 'NONE', 'NONE', 'underline', 'NONE', 'NONE', 'underline', s:black)
call s:HL('CursorLineNr', 'NONE', 'NONE', 'underline', 'NONE', 'NONE', 'underline', s:black)
" Prefer a consistent black underline for the cursor line in terminals that support it.
silent! highlight CursorLine ctermul=black
silent! highlight CursorLineNr ctermul=black
call s:HL('DiffAdd', s:white, s:green, 'NONE', 'white', 'darkgreen', 'NONE')
call s:HL('DiffChange', s:black, s:orange, 'NONE', 'black', 'darkyellow', 'NONE')
call s:HL('DiffDelete', s:white, s:red, 'NONE', 'white', 'darkred', 'NONE')
call s:HL('DiffText', s:white, s:blue, 'bold', 'white', 'blue', 'bold')
call s:HL('Directory', s:blue, 'NONE', 'bold', 'blue', 'NONE', 'bold')
call s:HL('Error', s:white, s:red, 'bold', 'white', 'darkred', 'bold')
call s:HL('FoldColumn', s:black, 'NONE', 'italic', 'black', 'NONE', 'italic')
call s:HL('Folded', s:blue, s:white, 'italic', 'blue', 'white', 'italic')
call s:HL('FloatBorder', s:black, s:white, 'NONE', 'black', 'white', 'NONE')
call s:HL('FloatTitle', s:green, s:white, 'bold', 'darkgreen', 'white', 'bold')
call s:HL('Identifier', s:green, 'NONE', 'NONE', 'blue', 'NONE', 'NONE')
call s:HL('Ignore', 'NONE', 'NONE', 'NONE', 'NONE', 'NONE', 'NONE')
call s:HL('IncSearch', s:black, s:orange, 'bold', 'black', 'darkyellow', 'bold')
call s:HL('LineNr', s:black, 'NONE', 'italic', 'black', 'NONE', 'italic')
call s:HL('MatchParen', s:black, s:orange, 'bold', 'black', 'darkyellow', 'bold')
call s:HL('ModeMsg', s:black, s:white, 'bold', 'black', 'white', 'bold')
call s:HL('MoreMsg', s:green, s:white, 'bold', 'darkgreen', 'white', 'bold')
call s:HL('NonText', s:white, s:white, 'NONE', 'white', 'white', 'NONE')
call s:HL('NormalFloat', s:black, s:white, 'NONE', 'black', 'white', 'NONE')
call s:HL('Pmenu', s:black, s:white, 'NONE', 'black', 'white', 'NONE')
call s:HL('PmenuBorder', s:black, s:white, 'NONE', 'black', 'white', 'NONE')
call s:HL('PmenuMatch', s:blue, s:white, 'bold', 'blue', 'white', 'bold')
call s:HL('PmenuMatchSel', s:black, s:orange, 'bold', 'black', 'darkyellow', 'bold')
call s:HL('PmenuSbar', s:white, s:white, 'NONE', 'white', 'white', 'NONE')
call s:HL('PmenuSel', s:black, s:orange, 'bold', 'black', 'darkyellow', 'bold')
call s:HL('PmenuThumb', s:black, s:black, 'NONE', 'black', 'black', 'NONE')
call s:HL('PreProc', s:blue, 'NONE', 'italic', 'blue', 'NONE', 'italic')
call s:HL('Question', s:orange, 'NONE', 'bold', 'darkyellow', 'NONE', 'bold')
call s:HL('QuickFixLine', s:white, s:blue, 'NONE', 'white', 'blue', 'NONE')
call s:HL('Search', s:white, s:blue, 'NONE', 'white', 'blue', 'NONE')
call s:HL('SignColumn', 'NONE', 'NONE', 'NONE', 'NONE', 'NONE', 'NONE')
call s:HL('Special', s:orange, 'NONE', 'NONE', 'darkyellow', 'NONE', 'NONE')
call s:HL('SpecialComment', s:orange, 'NONE', 'italic', 'darkyellow', 'NONE', 'italic')
call s:HL('SpecialChar', s:blue, 'NONE', 'NONE', 'blue', 'NONE', 'NONE')
call s:HL('SpecialKey', s:blue, 'NONE', 'bold', 'blue', 'NONE', 'bold')
call s:HL('SpellBad', s:red, 'NONE', 'undercurl', 'darkred', 'NONE', 'underline', s:red)
call s:HL('SpellCap', s:green, 'NONE', 'undercurl', 'darkgreen', 'NONE', 'underline', s:green)
call s:HL('SpellLocal', s:blue, 'NONE', 'undercurl', 'blue', 'NONE', 'underline', s:blue)
call s:HL('SpellRare', s:orange, 'NONE', 'undercurl', 'darkyellow', 'NONE', 'underline', s:orange)
call s:HL('Statement', s:green, 'NONE', 'bold', 'darkgreen', 'NONE', 'bold')
call s:HL('StatusLine', s:black, s:white, 'bold,underline', 'black', 'white', 'bold,underline')
call s:HL('StatusLineNC', s:black, s:white, 'italic,underline', 'black', 'white', 'italic,underline')
call s:HL('TabLine', s:black, s:white, 'underline', 'black', 'white', 'underline')
call s:HL('TabLineFill', s:black, s:white, 'underline', 'black', 'white', 'underline')
call s:HL('TabLineSel', s:black, s:white, 'bold,underline', 'black', 'white', 'bold,underline')
call s:HL('Title', s:green, 'NONE', 'bold', 'darkgreen', 'NONE', 'bold')
call s:HL('TitleBar', s:black, s:white, 'bold', 'black', 'white', 'bold')
call s:HL('TitleBarNC', s:black, s:white, 'italic', 'black', 'white', 'italic')
call s:HL('Todo', s:white, s:blue, 'bold', 'white', 'blue', 'bold')
call s:HL('ToolbarButton', s:black, s:white, 'bold,underline', 'black', 'white', 'bold,underline')
call s:HL('ToolbarLine', s:black, s:white, 'underline', 'black', 'white', 'underline')
call s:HL('Type', s:green, 'NONE', 'bold', 'darkgreen', 'NONE', 'bold')
call s:HL('Underlined', s:blue, 'NONE', 'underline', 'blue', 'NONE', 'underline')
call s:HL('VertSplit', s:black, s:white, 'NONE', 'black', 'white', 'NONE')
call s:HL('Visual', s:black, s:orange, 'NONE', 'black', 'darkyellow', 'NONE')
call s:HL('VisualNOS', s:black, 'NONE', 'underline', 'black', 'NONE', 'underline')
call s:HL('WarningMsg', s:orange, s:white, 'bold', 'darkyellow', 'white', 'bold')
call s:HL('WildMenu', s:black, s:orange, 'bold', 'black', 'darkyellow', 'bold')
call s:HL('WinBar', s:black, s:white, 'bold', 'black', 'white', 'bold')
call s:HL('WinBarNC', s:black, s:white, 'italic', 'black', 'white', 'italic')
call s:HL('WinSeparator', s:black, s:white, 'NONE', 'black', 'white', 'NONE')
call s:HL('lCursor', s:white, s:blue, 'NONE', 'white', 'blue', 'NONE')
call s:HL('DiagnosticError', s:red, 'NONE', 'NONE', 'darkred', 'NONE', 'NONE')
call s:HL('DiagnosticWarn', s:orange, 'NONE', 'NONE', 'darkyellow', 'NONE', 'NONE')
call s:HL('DiagnosticInfo', s:blue, 'NONE', 'NONE', 'blue', 'NONE', 'NONE')
call s:HL('DiagnosticHint', s:green, 'NONE', 'NONE', 'darkgreen', 'NONE', 'NONE')
call s:HL('DiagnosticOk', s:green, 'NONE', 'NONE', 'darkgreen', 'NONE', 'NONE')
call s:HL('DiagnosticUnderlineError', 'NONE', 'NONE', 'undercurl', 'NONE', 'NONE', 'underline', s:red)
call s:HL('DiagnosticUnderlineWarn', 'NONE', 'NONE', 'undercurl', 'NONE', 'NONE', 'underline', s:orange)
call s:HL('DiagnosticUnderlineInfo', 'NONE', 'NONE', 'undercurl', 'NONE', 'NONE', 'underline', s:blue)
call s:HL('DiagnosticUnderlineHint', 'NONE', 'NONE', 'undercurl', 'NONE', 'NONE', 'underline', s:green)

highlight StatusLine gui=bold cterm=bold term=bold
highlight StatusLineNC gui=italic cterm=italic term=italic

if exists('g:terminal_ansi_colors')
  let g:terminal_color_0 = s:black
  let g:terminal_color_1 = s:red
  let g:terminal_color_2 = s:green
  let g:terminal_color_3 = s:orange
  let g:terminal_color_4 = s:blue
  let g:terminal_color_5 = s:red
  let g:terminal_color_6 = s:blue
  let g:terminal_color_7 = s:white
  let g:terminal_color_8 = s:black
  let g:terminal_color_9 = s:red
  let g:terminal_color_10 = s:green
  let g:terminal_color_11 = s:orange
  let g:terminal_color_12 = s:blue
  let g:terminal_color_13 = s:red
  let g:terminal_color_14 = s:blue
  let g:terminal_color_15 = s:white
endif

