local M = {}

-- Function to toggle netrw in a left split
function M.toggle_netrw()
  -- Check if netrw is open
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    local buf = vim.api.nvim_win_get_buf(win)
    local bufname = vim.api.nvim_buf_get_name(buf)
    -- If we detect a netrw buffer, close it and return
    if bufname:match("NetrwTreeListing") then
      vim.cmd("Lclose")
      return
    end
  end
  -- Otherwise, open it in a left vertical split
  vim.cmd("Lexplore")
end

return M
