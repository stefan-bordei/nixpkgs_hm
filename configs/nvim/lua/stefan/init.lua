require("stefan.set")
require("stefan.remap")


local augroup = vim.api.nvim_create_augroup
local stefanGroup = augroup('stefan', {})
local autocmd = vim.api.nvim_create_autocmd
 autocmd({"BufWritePre"}, {
     group = stefanGroup,
     pattern = "*",
     command = [[%s/\s\+$//e]],
 })
