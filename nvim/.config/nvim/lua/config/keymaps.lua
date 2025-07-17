-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set

-- For conciseness
local opts = { noremap = true, silent = true }

-- save file
map("n", "<C-s>", "<cmd> w <CR>", opts)

-- save file without auto-formatting
map("n", "<leader>sn", "<cmd>noautocmd w <CR>", opts)

-- quit file
map("n", "<C-q>", "<cmd> q <CR>", opts)

-- delete single character without copying into register
map("n", "x", '"_x', opts)

-- Vertical scroll and center
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

-- Find and center
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- terminal
map("n", "<leader>t", "<cmd>ToggleTerm direction=float<CR>", { desc = "ToggleTerm float" })
