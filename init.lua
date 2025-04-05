-- Enable relative line numbers
vim.opt.relativenumber = true

-- Highlight the current line
vim.opt.cursorline = true

-- Remap exiting terminal mode to <C-t>
vim.api.nvim_set_keymap('t', '<C-t>', [[<C-\><C-n>]], { noremap = true, silent = true })

-- Use a single global status line
vim.opt.laststatus = 3
