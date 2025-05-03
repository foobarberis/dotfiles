"" General settings

" Set leader key to space for easier shortcuts
let mapleader=" "
" Use UTF-8 encoding
set encoding=utf-8
" Enable mouse support in all modes
set mouse=a
" Automatically reload files changed outside Vim
set autoread
" Flash the screen instead of beeping on errors
set visualbell
" Make backspace work more intuitively
set backspace=indent,eol,start
" Do not create backup or swap files
set nobackup noswapfile

"" Line numbers & display settings

" Show line numbers
set number
" Highlight the current cursor line
set cursorline
" Keep at least 2 lines above/below cursor when scrolling
set scrolloff=2
" Always show status line
set laststatus=2
" Show full path in the status line
set statusline=%F

"" Search settings

" Enable incremental search
set incsearch
" Highlight search matches
set hlsearch
" Ignore case unless search pattern contains uppercase
set ignorecase
set smartcase
" Enable recursive searching for filenames
set path+=**
" Limit the number of lines checked for modelines
set modelines=0

"" Indentation & Tabs

" Indent new lines the same as the previous line
set autoindent
" Convert tabs to spaces
set expandtab
" Use 2 spaces per tab
set tabstop=2 shiftwidth=2 softtabstop=2

"" UI Enhancements

" Enable syntax highlighting
syntax on
" Highlight matching parentheses, brackets, braces
set showmatch
" Show cursor position
set ruler
" Enable 24-bit colors in the terminal
set termguicolors
" Use a dark background
set bg=dark
" Set color scheme
colorscheme quiet
" Make keywords bold
highlight Keyword gui=bold
" Make comments italic
highlight Comment gui=italic
" Change color of constants
highlight Constant guifg=#999999
" Change color of Visual selection. Make the change persist even when changing
" colorscheme.
highlight Visual guibg=#303030 guifg=NONE gui=NONE
highlight VisualNC guibg=#303030 guifg=NONE gui=NONE
autocmd ColorScheme * highlight Visual guibg=#303030 guifg=NONE gui=NONE
autocmd ColorScheme * highlight VisualNC guibg=#303030 guifg=NONE gui=NONE

"" Clipboard

" Use system clipboard
set clipboard=unnamed    " macOS
" set clipboard=unnameplus " linux

"" Mappings

" Create a new note using an external script
nnoremap <leader>n :r !sh ~/.local/bin/new-note.sh<CR>

"" Wildmenu

" Enhance command-line completion
set wildmenu
set wildmode=list:longest,full

"" Folding

" Fold based on indentation level
set foldmethod=indent
" Maximum fold depth of 1
set foldnestmax=1
" Start with folds open
set foldlevelstart=1

"" File navigation

" Open netrw file explorer in a new tab
let g:netrw_browse_split = 3
" Change working directory to the current file
set autochdir
" Allow switching buffers without saving
set hidden
