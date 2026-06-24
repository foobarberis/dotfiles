" Name: nosyntax
" Monochrome UI-only theme for Vim with syntax highlighting disabled.

set background=light
hi clear
let g:colors_name = 'nosyntax'

let s:paper = '#F7F4EE'
let s:ink = '#1E1B18'

" Terminal Vim has no alpha in highlight groups. Use a pre-blended 10% ink
" overlay (black mixed into the paper background) for subtle selections.
let s:shade = '#E1DED9'

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
hi! link EndOfBuffer NonText
hi! link ErrorMsg Error
hi! link LineNrAbove LineNr
hi! link LineNrBelow LineNr
hi! link NormalNC Normal
hi! link Terminal Normal

call s:HL('Normal', s:ink, s:paper, 'NONE', 'black', 'white', 'NONE')
call s:HL('ColorColumn', s:ink, s:paper, 'underline', 'black', 'white', 'underline')
call s:HL('Conceal', s:ink, 'NONE', 'NONE', 'black', 'NONE', 'NONE')
call s:HL('Cursor', s:paper, s:ink, 'NONE', 'white', 'black', 'NONE')
call s:HL('CursorLine', 'NONE', 'NONE', 'underline', 'NONE', 'NONE', 'underline', s:ink)
call s:HL('CursorLineNr', 'NONE', 'NONE', 'italic,underline', 'NONE', 'NONE', 'italic,underline', s:ink)
" Prefer a consistent black underline for the cursor line in terminals that support it.
silent! highlight CursorLine ctermul=black
silent! highlight CursorLineNr ctermul=black
call s:HL('Directory', s:ink, 'NONE', 'bold', 'black', 'NONE', 'bold')
call s:HL('Error', s:paper, s:ink, 'bold', 'white', 'black', 'bold')
call s:HL('FloatBorder', s:ink, s:paper, 'NONE', 'black', 'white', 'NONE')
call s:HL('FloatTitle', s:ink, s:paper, 'bold', 'black', 'white', 'bold')
call s:HL('Ignore', 'NONE', 'NONE', 'NONE', 'NONE', 'NONE', 'NONE')
call s:HL('IncSearch', 'NONE', s:shade, 'NONE', 'NONE', 'NONE', 'NONE')
call s:HL('LineNr', s:ink, 'NONE', 'NONE', 'black', 'NONE', 'NONE')
call s:HL('ModeMsg', s:ink, s:paper, 'bold', 'black', 'white', 'bold')
call s:HL('MoreMsg', s:ink, s:paper, 'bold', 'black', 'white', 'bold')
call s:HL('NonText', s:paper, s:paper, 'NONE', 'white', 'white', 'NONE')
call s:HL('NormalFloat', s:ink, s:paper, 'NONE', 'black', 'white', 'NONE')
call s:HL('Pmenu', s:ink, s:paper, 'NONE', 'black', 'white', 'NONE')
call s:HL('PmenuBorder', s:ink, s:paper, 'NONE', 'black', 'white', 'NONE')
call s:HL('PmenuMatch', s:ink, s:paper, 'bold', 'black', 'white', 'bold')
call s:HL('PmenuMatchSel', s:ink, s:shade, 'bold', 'black', 'white', 'bold')
call s:HL('PmenuSbar', s:paper, s:paper, 'NONE', 'white', 'white', 'NONE')
call s:HL('PmenuSel', s:ink, s:shade, 'bold', 'black', 'white', 'bold')
call s:HL('PmenuThumb', s:ink, s:ink, 'NONE', 'black', 'black', 'NONE')
call s:HL('Question', s:ink, 'NONE', 'bold', 'black', 'NONE', 'bold')
call s:HL('Search', 'NONE', s:shade, 'NONE', 'NONE', 'NONE', 'NONE')
call s:HL('SpecialKey', s:ink, 'NONE', 'bold', 'black', 'NONE', 'bold')
call s:HL('StatusLine', s:ink, s:paper, 'NONE', 'black', 'white', 'NONE')
call s:HL('StatusLineNC', s:ink, s:paper, 'NONE', 'black', 'white', 'NONE')
call s:HL('Title', s:ink, 'NONE', 'bold', 'black', 'NONE', 'bold')
call s:HL('Todo', s:paper, s:ink, 'bold', 'white', 'black', 'bold')
call s:HL('Underlined', s:ink, 'NONE', 'underline', 'black', 'NONE', 'underline')
call s:HL('VertSplit', s:ink, s:paper, 'NONE', 'black', 'white', 'NONE')
call s:HL('Visual', 'NONE', s:shade, 'NONE', 'NONE', 'NONE', 'NONE')
call s:HL('VisualNOS', s:ink, 'NONE', 'underline', 'black', 'NONE', 'underline')
call s:HL('WarningMsg', s:ink, s:paper, 'bold', 'black', 'white', 'bold')
call s:HL('WildMenu', s:ink, s:shade, 'bold', 'black', 'white', 'bold')
call s:HL('WinSeparator', s:ink, s:paper, 'NONE', 'black', 'white', 'NONE')
call s:HL('lCursor', s:paper, s:ink, 'NONE', 'white', 'black', 'NONE')
