-- Load lazy configuration.
require("config.lazy")

-- Set leader key.
vim.g.mapleader = " "

-- Enable mouse in all modes.
vim.opt.mouse = "a"

-- Show cursor position.
vim.opt.ruler = true

-- Enable incremental search.
vim.opt.incsearch = true

-- Always display status line.
vim.opt.laststatus = 2

-- Auto-indent new lines.
vim.opt.autoindent = true

-- Set tab size.
vim.opt.tabstop = 2

-- Set number of spaces to use for indentation.
vim.opt.shiftwidth = 2

-- Convert tabs to spaces.
vim.opt.expandtab = true

-- Show line numbers.
vim.opt.number = true

-- Highlight current line.
vim.opt.cursorline = true

-- Always report changes (no threshold).
vim.opt.report = 0

-- Show whitespace characters.
-- Enable with :set list
vim.opt.listchars = { eol = "⏎", tab = "␉·", trail = "␠", nbsp = "⎵" }

-- Map leader+n to a new note script.
vim.api.nvim_set_keymap("n", "<leader>n", ":r !sh ~/.local/bin/new-note.sh<CR>", { noremap = true, silent = true })

-- Remove "disable mouse" from PopUp menu.
vim.cmd("aunmenu PopUp.How-to\\ disable\\ mouse")
vim.cmd("aunmenu PopUp.-1-")

-- Set "quiet" colorscheme.
vim.cmd("colorscheme modus_vivendi")

