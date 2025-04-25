let mapleader = " "

syntax off
set mouse=a
set ruler
set incsearch
set laststatus=2
set autoindent tabstop=4 shiftwidth=4 expandtab
set number relativenumber

" Threshold for reporting number of lines changed.
set report=0

" Use :set list or :set nolist to enable / disable showing whitespace characters
set listchars=eol:⏎,tab:␉·,trail:␠,nbsp:⎵

nnoremap <leader>n :r ! sh ~/.local/bin/new-note.sh<CR>
