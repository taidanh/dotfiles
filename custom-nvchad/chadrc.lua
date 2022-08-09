-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
  theme = "blossom",
}

M.mappings = require "custom.mappings"

local plugin_confs = require "custom.plugins.configs"

M.plugins = {
  override = {
      ["nvim-treesitter/nvim-treesitter"] = plugin_confs.treesitter,
     -- ["NvChad/ui"] = {
     --   tabufline = {
     --      lazyload = false, -- to show tabufline by default
     --       overriden_modules = function()
     --           return require "custom.xyz"
     --       end,
     --   },
     -- },
  },
  user = require "custom.plugins"
}

return M
