vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pb", "<Esc>:Telescope buffers<CR>")
vim.keymap.set("n", "<leader>j", "<Esc>:bnext<CR>")
vim.keymap.set("n", "<leader>k", "<Esc>:bprevious<CR>")

--GO
vim.keymap.set("n", "<leader>gf", "<Esc>:!gofmt -e -w %<CR>")

-- Tmux navigation
vim.keymap.set("n", "<C-j>", "<Esc>:TmuxNavigateDown<CR>")
vim.keymap.set("n", "<C-k>", "<Esc>:TmuxNavigateUp<CR>")
vim.keymap.set("n", "<C-h>", "<Esc>:TmuxNavigateLeft<CR>")
vim.keymap.set("n", "<C-l>", "<Esc>:TmuxNavigateRight<CR>")
