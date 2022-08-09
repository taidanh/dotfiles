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
  i = {
    ["jk"] = { "<Esc>" },
  },
  n = {
    ["<leader>wf"] = { "<cmd>w<cr>" },
    ["<leader>wa"] = { "<cmd>wa<cr>" },
  },

  t = {
    ["jk"] = { "<C-\\><C-n>" },
    ["<C-h>"] = { "<C-\\><C-n><C-w>h" },
    ["<C-j>"] = { "<C-\\><C-n><C-w>j" },
    ["<C-k>"] = { "<C-\\><C-n><C-w>k" },
    ["<C-l>"] = { "<C-\\><C-n><C-w>l" },
  }
}

M.tabufline = {
  i = {
    -- more keys!
  },
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
}

return M
