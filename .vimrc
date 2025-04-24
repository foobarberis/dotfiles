let mapleader = " "

syntax off
set mouse=a
set ruler
set incsearch
set laststatus=2
set autoindent tabstop=4 shiftwidth=4 expandtab
set number relativenumber

set list
set listchars=eol:⏎,tab:␉·,trail:␠,nbsp:⎵

nnoremap <leader>n :r ! sh ~/.local/bin/new-note.sh<CR>
