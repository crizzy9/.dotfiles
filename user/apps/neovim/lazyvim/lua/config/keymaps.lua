-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>F", ":BufferLineMoveNext<CR>", { buffer = buffer, desc = "Move Buffer Right" })
vim.keymap.set("n", "<leader>A", ":BufferLineMovePrev<CR>", { buffer = buffer, desc = "Move Buffer Left" })
vim.keymap.set("n", "<leader>ax", ":AvanteClear<CR>", { buffer = buffer, desc = "Avante: Clear Chat History" })
vim.keymap.set("n", "<leader>i", function() require("harpoon"):list():prev() end, { buffer = buffer, desc = "Avante: Clear Chat History" })
vim.keymap.set("n", "<leader>o", function() require("harpoon"):list():next() end, { buffer = buffer, desc = "Avante: Clear Chat History" })
-- vim.keymap.set("n", "<leader>tw", ":%s/\s\+$\\e<CR>", { buffer = buffer, desc = "Remove Trailing Whitespace"})
