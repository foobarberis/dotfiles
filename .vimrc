" General settings
set encoding=utf-8 " Use UTF-8 encoding
set mouse=a " Enable mouse support in all modes
set autoread " Automatically reload files changed outside Vim
set belloff=all " Disable bell sound / flash
set backspace=indent,eol,start " Make backspace work more intuitively
set nobackup noswapfile " Do not create backup or swap files

" Line numbers & display settings
set number " Show line numbers
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
set listchars=eol:↲,tab:▸·,trail:•,nbsp:⎵ " Display special characters for whitespace
set showmatch " Highlight matching parentheses, brackets, braces
set ruler " Show cursor position
colorscheme default

" Clipboard
if system('uname -s') == "Darwin\n"
  " macOS
  set clipboard=unnamed
else
  "Linux
  set clipboard=unnamedplus
endif

" Wildmenu
set wildmenu " Enhance command-line completion
set wildmode=list:longest,full " Wildmode settings

" File navigation
let g:netrw_browse_split = 3 " Open netrw file explorer in a new tab
set autochdir " Change working directory to the current file
set hidden " Allow switching buffers without saving
