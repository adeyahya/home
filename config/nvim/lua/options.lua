vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.clipboard = 'unnamedplus'

vim.o.number = true
vim.o.relativenumber = true

vim.o.signcolumn = 'yes'

vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2

vim.o.updatetime = 300

vim.o.termguicolors = true

vim.o.mouse = 'a'

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shell = "bash"
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.ai = true -- Auto indent

local keymap = vim.keymap

keymap.set("n", ";;", "<cmd>update<cr>", {})
keymap.set("n", "q", "<cmd>q<cr>", {})

-- select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- split window
keymap.set('n', 'ss', ':split<Return><C-w>w', { silent = true })
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })

-- navigate window
keymap.set('n', 'sw', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sl', '<C-w>l')

-- indentation
keymap.set('x', 'J', ":move '>+1<CR>gv-gv", {})
keymap.set('x', 'K', ":move '<-2<CR>gv-gv", {})
keymap.set('x', 'L', '>gv', {})
keymap.set('x', 'H', '<gv', {})
