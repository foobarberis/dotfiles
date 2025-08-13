" Set leader key to Space
let mapleader = " "

" Disable the built-in matchparen plugin as it causes annoying cursor behavior.
let g:loaded_matchparen = 1
let g:loaded_netrw = 1

" Hide entry for the right click menu
aunmenu PopUp.How-to\ disable\ mouse
aunmenu PopUp.-2-

" General settings
set encoding=utf-8 " Use UTF-8 encoding
set mouse=a " Enable mouse support in all modes
set autoread " Automatically reload files changed outside Vim
set belloff=all " Disable bell sound / flash
set backspace=indent,eol,start " Make backspace work more intuitively
set nobackup noswapfile " Do not create backup or swap files

" Line numbers & display settings
" set number " Show line numbers
set cursorline " Highlight the current cursor line
set scrolloff=2 " Keep at least 2 lines above/below cursor when scrolling
set laststatus=2 " Always show status line
set statusline=%F " Show full path in the status line

" Search settings
set incsearch " Enable incremental search
set hlsearch " Highlight search matches
set ignorecase " Ignore case unless search pattern contains uppercase
set smartcase " Enable smart case search
set path+=** " Enable recursive searching for filenames
set modelines=0 " Limit the number of lines checked for modelines

" Indentation & Tabs
set autoindent " Indent new lines the same as the previous line
set expandtab " Convert tabs to spaces
set tabstop=2 shiftwidth=2 softtabstop=2 " Use 2 spaces per tab

" UI Enhancements
syntax on
colorscheme darkblue
set ruler " Show cursor position
set listchars=eol:↲,tab:▸·,trail:•,nbsp:⎵ " Display special characters for whitespace

" Clipboard
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed
else
  set clipboard=unnamedplus
endif

" Wildmenu
set wildmenu " Enhance command-line completion
set wildmode=list:longest,full " Wildmode settings

" Jump to the next/previous sector heading
nnoremap <leader>] /^+ SEC/<CR>:nohl
nnoremap <leader>[ ?^+ SEC/<CR>:nohl

" Append new sector to the journal
nnoremap <leader>s :let title = input('New sector title: ') \| if !empty(title) \| execute "normal! G" \| execute "r! journal -s " . shellescape(title) \| execute "normal! o" \| endif<CR>

" Create a new LOG entry.
nnoremap <leader>l mm/^+ SEC\/.* LOG +$<CR>:nohl<CR>jo<Esc>:r! journal -l<CR>A

" Create a new INBOX entry
nnoremap <leader>i mm/^+ SEC\/.* INBOX +$<CR>:nohl<CR>jjo-

" Update the Table of Contents
nnoremap <leader>t :execute 'silent !~/.local/bin/journal -t ' . shellescape(expand('%')) \| checktime \| redraw!<CR>
