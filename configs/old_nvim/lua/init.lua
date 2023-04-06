local api, cmd, fn, g = vim.api, vim.cmd, vim.fn, vim.g
local opt, wo = vim.opt, vim.wo
local fmt = string.format

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  api.nvim_set_keymap(mode, lhs, rhs, options)
end

opt.expandtab = true
opt.linespace = 1
opt.nu = true
opt.backspace = 'indent,eol,start'
opt.mouse = 'a'
opt.autoindent = true
opt.ruler = true
opt.showcmd = true
opt.incsearch = true
opt.relativenumber = false
opt.smartindent = true
opt.smarttab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.clipboard = 'unnamed,unnamedplus'
vim.cmd('set nohlsearch')
vim.cmd('set title')
vim.cmd('set hidden')
vim.cmd('set nowrap')
vim.cmd('set signcolumn=yes')
vim.cmd('set colorcolumn=120')
vim.cmd('set cursorline')
vim.cmd('set termguicolors')
vim.cmd('set scrolloff=5')

map('', '<leader>c', '"+y')
map('', '<F2>', ':w!<CR>')
map('', '<F3>', ':NERDTreeToggle<CR>')
map('', '<F4>', ':bdelete<CR>')
map('', '<F5>', ':bprevious<CR>')
map('', '<F6>', ':bnext<CR>')

-- telescope mapping
map('', '<C-f>', ':Telescope find_files<CR>')
map('', '<C-g>', ':Telescope live_grep<CR>')

-- require'lspconfig'.clangd.setup{on_attach=require'completion'.on_attach}

