local M = {}

local function buffer_location(start_line, end_line)
  local name = vim.api.nvim_buf_get_name(0)
  local path = name ~= "" and vim.fn.fnamemodify(name, ":.") or "[No Name]"
  if start_line == end_line then
    return string.format("%s:L%d", path, start_line)
  end
  return string.format("%s:L%d-L%d", path, start_line, end_line)
end

local function copy_location(text)
  vim.fn.setreg('"', text)
  vim.fn.setreg("+", text)
  vim.notify("Copied " .. text)
end

function M.setup()
  vim.keymap.set("n", "Y", function()
    copy_location(buffer_location(vim.fn.line("."), vim.fn.line(".")))
  end, { desc = "Copy file location" })

  vim.keymap.set("x", "Y", function()
    local start_line = vim.fn.line("v")
    local end_line = vim.fn.line(".")
    if start_line > end_line then
      start_line, end_line = end_line, start_line
    end
    copy_location(buffer_location(start_line, end_line))
  end, { desc = "Copy file location range" })
end

return M
