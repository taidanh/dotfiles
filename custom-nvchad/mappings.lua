-- lua/custom/mappings 
local M = {}

-- add this table only when you want to disable default keys
-- M.disabled = {
--   n = {
--       ["<leader>h"] = "",
--       ["<C-s>"] = ""
--   }
-- }

M.general = {
  -- stuff
  n = {
  }
}

M.tabufline = {
  plugin = true,
  n = {
    ["L"] = {
      function()
        require("core.utils").tabuflineNext()
      end,
      "  goto next buffer",
    },

    ["H"] = {
      function()
        require("core.utils").tabuflinePrev()
      end,
      "  goto prev buffer",
    },
  },

  i = {
    -- more keys!
  }
}

return M
