-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set( "n", "<leader>F", ":BufferLineMoveNext<CR>", { buffer = buffer, desc = "Move Buffer Right" })
vim.keymap.set( "n", "<leader>A", ":BufferLineMovePrev<CR>", { buffer = buffer, desc = "Move Buffer Left" })
