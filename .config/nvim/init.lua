-- DISABLE PLUGINS
vim.g.loaded_matchparen = 1
vim.g.loaded_netrw = 1

-- GENERAL SETTINGS
vim.g.mapleader = " "
vim.opt.encoding = "utf-8"
vim.opt.mouse = "a"
vim.cmd([[aunmenu PopUp.How-to\ disable\ mouse]])
vim.cmd([[aunmenu PopUp.-2-]])
vim.opt.autoread = true
vim.opt.belloff = "all"
vim.opt.backspace = "indent,eol,start"
vim.opt.backup = false
vim.opt.swapfile = false

-- LINE NUMBERS & DISPLAY SETTINGS
vim.opt.number = false
vim.opt.cursorline = true
vim.opt.scrolloff = 2
vim.opt.laststatus = 2
vim.opt.statusline = "%F"

-- SEARCH SETTINGS
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.path:append({ "**" })
vim.opt.modelines = 0

-- INDENTATION & TABS
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

-- UI ENHANCEMENTS
vim.cmd([[syntax on]])
vim.cmd([[colorscheme darkblue]])
vim.opt.ruler = true
vim.opt.listchars = { eol = "↲", tab = "▸·", trail = "•", nbsp = "⎵" }

-- CLIPBOARD
if vim.fn.has("macunix") == 1 then
  vim.opt.clipboard = "unnamed"
else
  vim.opt.clipboard = "unnamedplus"
end

-- WILDMENU
vim.opt.wildmenu = true
vim.opt.wildmode = "list:longest,full"
