local M = {}

function M.setup(_)
  -- require("dap-python").setup("python", {})
  local dap = require('dap')
  dap.adapters.python = {
    type = 'executable';
    command = os.getenv('HOME') .. '/.virtualenvs/tools/bin/python';
    args = { '-m', 'debugpy.adapter' };
  }
end

return M
