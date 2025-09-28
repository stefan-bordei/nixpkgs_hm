vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pb", "<Esc>:Telescope buffers<CR>")

vim.keymap.set("i", "jj", "<Esc>")

-- Navigating
require("harpoon").setup()
vim.keymap.set("n", "<leader>a", '<Esc>:lua require("harpoon.mark").add_file()<CR>')
vim.keymap.set("n", "<leader>hs", '<Esc>:lua require("harpoon.ui").toggle_quick_menu()<CR>')

vim.keymap.set("n", "<leader>j", '<Esc>:lua require("harpoon.ui").nav_next()<CR>')
vim.keymap.set("n", "<leader>k", '<Esc>:lua require("harpoon.ui").nav_prev()<CR>')

-- Go
vim.keymap.set("n", "<leader>gf", "<Esc>:!gofmt -e -w %<CR>")

-- Tmux navigation
vim.keymap.set("n", "<C-j>", "<Esc>:TmuxNavigateDown<CR>")
vim.keymap.set("n", "<C-k>", "<Esc>:TmuxNavigateUp<CR>")
vim.keymap.set("n", "<C-h>", "<Esc>:TmuxNavigateLeft<CR>")
vim.keymap.set("n", "<C-l>", "<Esc>:TmuxNavigateRight<CR>")
