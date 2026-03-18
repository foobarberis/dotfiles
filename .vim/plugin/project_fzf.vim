if exists('g:loaded_project_fzf')
  finish
endif
let g:loaded_project_fzf = 1

function! s:project_root() abort
  let l:root = system('git rev-parse --show-toplevel 2>/dev/null')
  if v:shell_error == 0
    let l:root = substitute(l:root, '\n\+$', '', '')
    if !empty(l:root)
      return l:root
    endif
  endif
  return getcwd()
endfunction

function! s:ensure_executables(names) abort
  for l:name in a:names
    if !executable(l:name)
      execute 'echoerr ' . string('Missing executable: ' . l:name)
      return 0
    endif
  endfor
  return 1
endfunction

function! s:run_picker(root, command) abort
  let l:tmp = tempname()
  let l:lines = []

  try
    let l:shell_cmd = 'cd ' . shellescape(a:root) . ' && ' . a:command . ' > ' . shellescape(l:tmp)
    " Prevent :! from expanding shell-command metacharacters inside args.
    silent execute '!' . escape(l:shell_cmd, '!%#')
    redraw!

    if filereadable(l:tmp)
      let l:lines = readfile(l:tmp)
    endif
  finally
    if filereadable(l:tmp)
      call delete(l:tmp)
    endif
  endtry

  return empty(l:lines) ? '' : l:lines[0]
endfunction

function! ProjectFiles() abort
  if !s:ensure_executables(['fzf', 'fd'])
    return
  endif

  let l:root = s:project_root()
  let l:selection = s:run_picker(
        \ l:root,
        \ "fd -t f -H -E .git . | fzf --scheme=path --prompt='Files> '"
        \ )

  if empty(l:selection)
    return
  endif

  execute 'edit ' . fnameescape(simplify(l:root . '/' . l:selection))
endfunction

function! ProjectGrep() abort
  if !s:ensure_executables(['fzf', 'rg'])
    return
  endif

  call inputsave()
  try
    let l:query = input('Grep> ')
  finally
    call inputrestore()
  endtry

  if empty(l:query)
    return
  endif

  let l:root = s:project_root()
  let l:rg_cmd = 'rg --vimgrep --smart-case --hidden -g '
        \ . shellescape('!.git')
        \ . ' '
        \ . shellescape(l:query)
  let l:selection = s:run_picker(
        \ l:root,
        \ l:rg_cmd . " | fzf --delimiter : --nth 4.. --prompt='Grep> '"
        \ )

  if empty(l:selection)
    return
  endif

  let l:match = matchlist(l:selection, '^\(.\{-}\):\(\d\+\):\(\d\+\):\(.*\)$')
  if empty(l:match)
    execute 'echoerr ' . string('Invalid grep result: ' . l:selection)
    return
  endif

  let l:file = l:match[1]
  let l:line = str2nr(l:match[2])
  let l:column = str2nr(l:match[3])

  if l:line <= 0 || l:column <= 0
    execute 'echoerr ' . string('Invalid grep result: ' . l:selection)
    return
  endif

  execute 'edit ' . fnameescape(simplify(l:root . '/' . l:file))
  call cursor(l:line, l:column)
  normal! zvzz
endfunction

command! ProjectFiles call ProjectFiles()
command! ProjectGrep call ProjectGrep()
