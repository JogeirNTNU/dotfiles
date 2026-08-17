-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local opts = { noremap = true, silent = true }
local k = vim.keymap.set
vim.keymap.set("i", "jj", "<ESC>", opts)
vim.keymap.set("n", "<ESC><ESC>", ":noh<CR>", opts)
-- my impending doom
k("i", "<Up>", "<Nop>", opts)
k("i", "<Down>", "<Nop>", opts)
k("i", "<Left>", "<Nop>", opts)
k("i", "<Right>", "<Nop>", opts)
k("n", "<Up>", "<Nop>", opts)
k("n", "<Down>", "<Nop>", opts)
k("n", "<Left>", "<Nop>", opts)
k("n", "<Right>", "<Nop>", opts)
k("i", "<C-Up>", "<Nop>", opts)
k("i", "<C-Down>", "<Nop>", opts)
k("i", "<C-Left>", "<Nop>", opts)
k("i", "<C-Right>", "<Nop>", opts)
k("n", "<C-Up>", "<Nop>", opts)
k("n", "<C-Down>", "<Nop>", opts)
k("n", "<C-Left>", "<Nop>", opts)
k("n", "<C-Right>", "<Nop>", opts)
k("i", "<S-Up>", "<Nop>", opts)
k("i", "<S-Down>", "<Nop>", opts)
k("i", "<S-Left>", "<Nop>", opts)
k("i", "<S-Right>", "<Nop>", opts)
k("n", "<S-Up>", "<Nop>", opts)
k("n", "<S-Down>", "<Nop>", opts)
k("n", "<S-Left>", "<Nop>", opts)
k("n", "<S-Right>", "<Nop>", opts)

k("n", "<leader>nc", ":e ~/.config/nvim/<CR>", opts)
