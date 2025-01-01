-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map({ "n", "v" }, "<C-a>", "^")
map({ "n", "v" }, "<C-e>", "$")
map("i", "<C-a>", "<Home>")
map("i", "<C-e>", "<End>")
