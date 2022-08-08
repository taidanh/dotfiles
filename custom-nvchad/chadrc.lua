-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
  theme = "blossom",
}

M.mapppings = require "custom.mappings"

M.plugins = {
  override = {
      ["nvim-treesitter/nvim-treesitter"] = {
        ensure_installed = {
          "html",
          "css",
       },
     },
     -- ["NvChad/ui"] = {
     --   tabufline = {
     --      lazyload = false, -- to show tabufline by default
     --       overriden_modules = function()
     --           return require "custom.xyz"
     --       end,
     --   },
     -- },
  },
  user = {
    ["goolord/alpha-nvim"] = {
      disable = false,
    },
    ["folke/which-key.nvim"] = {
      config = function ()
        require("which-key").setup()
      end,
    },
   },
}

return M
