require("stefan.set")
require("stefan.remap")

local augroup = vim.api.nvim_create_augroup
local stefanGroup = augroup("stefan", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_gr = augroup("HighlightYank", {})

autocmd("TextYankPost", {
	group = yank_gr,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

autocmd({ "BufWritePre" }, {
	group = stefanGroup,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.winsize = 25
