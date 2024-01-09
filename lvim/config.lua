--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.builtin.dap.active = true
lvim.format_on_save = false
lvim.log.level = "warn"
vim.filetype.indent = true
vim.filetype.plugin = true
vim.opt.cmdheight = 1
vim.opt.scrolloff = 7
vim.wo.lbr = true -- wrap whole words
vim.wo.rnu = true
vim.cmd("set spelllang=en")
vim.cmd("set spellsuggest=best,9")

-- colorscheme
-- vim.opt.background = "light"
vim.g.tokyonight_style = "day"
lvim.colorscheme = "blossom"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

local opts = {}

-- add your own keymapping
lvim.keys.insert_mode["jk"]    = "<esc>"
lvim.keys.insert_mode["kj"]    = "<esc>"
lvim.keys.insert_mode["<C-a>"] = "<esc>I"
lvim.keys.insert_mode["<C-e>"] = "<esc>A"
lvim.keys.insert_mode["<C-h>"] = vim.lsp.buf.signature_help()

lvim.keys.normal_mode["<C-s>"]     = ":w<cr>"
lvim.keys.normal_mode["<Leader>y"] = "\"+y"
lvim.keys.normal_mode["<Leader>Y"] = "\"+yg_"
lvim.keys.normal_mode["H"]         = "<cmd>BufferLineCyclePrev<cr>"
lvim.keys.normal_mode["L"]         = "<cmd>BufferLineCycleNext<cr>"
lvim.keys.normal_mode["<C-t>"]     = "<cmd>ToggleTerm<cr>"
lvim.keys.normal_mode["j"]         = "gj"
lvim.keys.normal_mode["k"]         = "gk"
lvim.keys.normal_mode["gd"]         = vim.lsp.buf.definition(opts)
lvim.keys.normal_mode["[d"]         = vim.diagnostic.goto_next(opts)
lvim.keys.normal_mode["]d"]         = vim.diagnostic.goto_prev(opts)

lvim.keys.visual_mode["<Leader>y"] = "\"+y"
lvim.keys.visual_mode["j"]         = "gj"
lvim.keys.visual_mode["k"]         = "gk"

local function setupTermKeys()
  vim.cmd("tnoremap <Esc> <C-\\><C-n>")
  vim.cmd("tnoremap jk    <C-\\><C-n>")
  vim.cmd("tnoremap <C-h> <C-\\><C-n><C-W>h")
  vim.cmd("tnoremap <C-j> <C-\\><C-n><C-W>j")
  vim.cmd("tnoremap <C-k> <C-\\><C-n><C-W>k")
  vim.cmd("tnoremap <C-l> <C-\\><C-n><C-W>l")
  vim.cmd("tnoremap <C-t> <cmd>ToggleTerm<cr>")

  vim.cmd("nnoremap cs    :lua MiniTrailspace.trim()<CR>")
end

setupTermKeys()

lvim.autocommands = {
  {
    "BufEnter", {
      pattern = { "*.php", "*.rs", "*.c", "*.cpp", },
      command = "setlocal shiftwidth=4 softtabstop=4 expandtab",
    },
    "BufEnter", {
      pattern = { "*.lua", "*.hs", "*.vue", "*.ts", "*.js", },
      command = "setlocal shiftwidth=2 softtabstop=2 expandtab",
    },
  },
}

-- required plugins
require('scope').setup()
require('lsp_signature').setup()
require('mini.surround').setup()
require('mini.cursorword').setup()
require('mini.trailspace').setup()
require('mini.indentscope').setup()

-- additional plugin setup
-- Animation = function(s, n)
--   return 50 / s
-- end
-- MiniIndentscope.config.draw.animation = Animation

-- require('lualine').setup({
--   sections = { lualine_a = { 'mode' } }
-- })

-- vim.cmd("au BufRead,BufNewFile *.g4 set filetype=antlr4")
-- required files
-- require('dap-init')

-- lvim.keys.terminal_mode["<Esc>"] = "<C-\><C-n>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "" }
lvim.builtin.treesitter.highlight.enabled = true

-- Rust settings
-- local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.7.0/'
-- local codelldb_path = extension_path .. 'adapter/codelldb'
-- local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'

-- local rust_opts = {
--   dap = {
--     adapter = require('rust-tools.dap').get_codelldb_adapter(
--       codelldb_path, liblldb_path)
--   }
-- }

-- require('rust-tools').setup(rust_opts)

-- local dap = require('dap')
-- dap.adapters.codelldb = {
--   type = 'server',
--   host = '127.0.0.1',
--   port = "${port}",
--   executable = {
--     command = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.7.0/adapter/codelldb',
--     args = { "--port", "${port}" },
--   },
--   -- name = 'codelldb',
-- }

-- dap.adapters.lldb = {
--   type = 'executable',
--   command = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.7.0/lldb/bin/lldb',
--   name = 'lldb'
-- }

-- dap.configurations.cpp = {
--   {
--     name = 'Launch file',
--     type = 'lldb',
--     request = 'launch',
--     program = function()
--       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--     end,
--     cwd = '${workspaceFolder}',
--     stopOnEntry = false,
--     args = {},
--   },
-- }
-- dap.configurations.c = dap.configurations.cpp
-- dap.configurations.rust = dap.configurations.cpp

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skiipped for the current filetype
-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
lvim.plugins = {
  { "NLKNguyen/papercolor-theme" },
  { "folke/trouble.nvim" },
  { "github/copilot.vim" },
  { "elixir-editors/vim-elixir" },
  { "echasnovski/mini.nvim" },
  { "tiagovla/scope.nvim" },
  { "ray-x/lsp_signature.nvim" },
  { "liuchengxu/vista.vim" },
  { "LunarVim/Colorschemes" },
  { "simrat39/rust-tools.nvim" },
  { "rayes0/blossom.vim" },
  { "dylon/vim-antlr" },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })

require('mason-lspconfig').setup_handlers({
  function(server)
    require('lvim.lsp.manager').setup(server)
  end
})


vim.api.nvim_create_autocmd("FileType", {
  pattern = "zsh",
  callback = function()
    -- let treesitter use bash highlight for zsh files as well
    require("nvim-treesitter.highlight").attach(0, "bash")
  end,
})
