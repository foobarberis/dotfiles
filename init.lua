-- Enable relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Highlight the current line
vim.opt.cursorline = true

-- Remap exiting terminal mode to <C-t>
vim.api.nvim_set_keymap('t', '<C-t>', [[<C-\><C-n>]], { noremap = true, silent = true })

-- Use a single global status line
vim.opt.laststatus = 3

-- Set tabstop to 4 spaces
vim.opt.shiftwidth = 4
