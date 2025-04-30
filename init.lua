vim.g.mapleader = " "

vim.opt.syntax = "on"
vim.opt.mouse = "a"
vim.opt.ruler = true
vim.opt.incsearch = true
vim.opt.laststatus = 2
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true

-- Threshold for reporting number of lines changed
vim.opt.report = 0

-- Whitespace characters visibility
vim.opt.listchars = { eol = "⏎", tab = "␉·", trail = "␠", nbsp = "⎵" }
vim.opt.list = false

-- Key mappings
vim.api.nvim_set_keymap("n", "<leader>n", ":r !sh ~/.local/bin/new-note.sh<CR>", { noremap = true, silent = true })

vim.cmd("aunmenu PopUp.How-to\\ disable\\ mouse")
vim.cmd("aunmenu PopUp.-1-")
vim.cmd("colorscheme sorbet")
