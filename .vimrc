" General settings
let mapleader=" " " Set leader key to space for easier shortcuts
set encoding=utf-8 " Use UTF-8 encoding
set mouse=a " Enable mouse support in all modes
set autoread " Automatically reload files changed outside Vim
set visualbell " Flash the screen instead of beeping on errors
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
syntax on " Enable syntax highlighting
set listchars=eol:↲,tab:▸·,trail:•,nbsp:⎵ " Display special characters for whitespace
set showmatch " Highlight matching parentheses, brackets, braces
set ruler " Show cursor position
set termguicolors " Enable 24-bit colors in the terminal
set bg=dark " Use a dark background
colorscheme quiet " Set color scheme
highlight link yamlBlockMappingKey Statement " Make YAML keywords bold
highlight link tomlTable Statement " Make TOML keywords bold
highlight link xmlTag Statement " Make XML < > characters bold
highlight link xmlTagName Statement " Make XML keywords bold
highlight Statement cterm=bold gui=bold " Make keywords bold
highlight Comment cterm=italic gui=italic " Make comments italic
highlight Constant guifg=#999999 " Change color of constants
highlight Visual guibg=#303030 guifg=NONE gui=NONE " Change color of Visual selection
highlight VisualNC guibg=#303030 guifg=NONE gui=NONE 
autocmd ColorScheme * highlight Visual guibg=#303030 guifg=NONE gui=NONE 
autocmd ColorScheme * highlight VisualNC guibg=#303030 guifg=NONE gui=NONE 
autocmd BufNewFile,BufRead *Jenkinsfile* set syntax=groovy " Enable syntax highlight for Groovy files

" Clipboard
if system('uname -s') == "Darwin\n"
  " macOS
  set clipboard=unnamed
else
  "Linux
  set clipboard=unnamedplus
endif

" Mappings
" Create a new note using an external script
nnoremap <leader>n :r !sh ~/.local/bin/new-note.sh<CR>
" Display highlight groups information about the word under the curor
map <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

" Wildmenu
set wildmenu " Enhance command-line completion
set wildmode=list:longest,full " Wildmode settings

" Folding
set foldmethod=indent " Fold based on indentation level
set foldnestmax=1 " Maximum fold depth of 1
set foldlevelstart=1 " Start with folds open

" File navigation
let g:netrw_browse_split = 3 " Open netrw file explorer in a new tab
set autochdir " Change working directory to the current file
set hidden " Allow switching buffers without saving

