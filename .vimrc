let mapleader = " "

syntax on
set mouse=a
set ruler
set incsearch
set laststatus=2
set autoindent tabstop=2 shiftwidth=2 expandtab
set number relativenumber

" Threshold for reporting number of lines changed.
set report=0

" Use :set list or :set nolist to enable / disable showing whitespace characters
set listchars=eol:⏎,tab:␉·,trail:␠,nbsp:⎵

nnoremap <leader>n :r ! sh ~/.local/bin/new-note.sh<CR>
