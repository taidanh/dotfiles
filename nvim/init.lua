--# imports
local utils = require("utils")

--# remaps
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true, silent = true })
vim.keymap.set('i', 'kj', '<Esc>', { noremap = true, silent = true })
vim.keymap.set('t', '<C-t>', [[<C-\><C-n>]], { noremap = true, silent = true })

vim.keymap.set('v', '<space><space>', '<Esc>', { noremap = true, silent = true })

vim.keymap.set('n', '<space>w', ':w<cr>', { noremap = true, silent = true })

--# remap movement
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', 'H', ':BufferLineCyclePrev<cr>', { noremap = true, silent = true })
vim.keymap.set('n', 'L', ':BufferLineCycleNext<cr>', { noremap = true, silent = true })

vim.keymap.set('i', '<C-h>', '<esc><C-w>h', { noremap = true, silent = true })
vim.keymap.set('i', '<C-l>', '<esc><C-w>l', { noremap = true, silent = true })
vim.keymap.set('i', '<C-j>', '<esc><C-w>j', { noremap = true, silent = true })
vim.keymap.set('i', '<C-k>', '<esc><C-w>k', { noremap = true, silent = true })

--# settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.o.scrolloff = 7

vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		if vim.bo.buftype == "terminal" then
			vim.cmd("startinsert")
		end
	end,
})

-- Map <Space>e to toggle netrw
vim.keymap.set("n", "<Space>e", utils.toggle_netrw, { noremap = true, silent = true })

-- Plugins
require("config.lazy")

-- require("config.lazy").setup({
--   spec = {
--     -- import your plugins
--     { import = "plugins.init" },
--   },
-- })
