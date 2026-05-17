local M = {}

local function buffer_location(start_line, end_line, modifier)
  local name = vim.api.nvim_buf_get_name(0)
  local path = name ~= "" and vim.fn.fnamemodify(name, modifier or ":.") or "[No Name]"
  if start_line == end_line then
    return string.format("%s:L%d", path, start_line)
  end
  return string.format("%s:L%d-L%d", path, start_line, end_line)
end

local function buffer_path(modifier)
  local name = vim.api.nvim_buf_get_name(0)
  return name ~= "" and vim.fn.fnamemodify(name, modifier or ":.") or "[No Name]"
end

local function copy_location(text)
  vim.fn.setreg('"', text)
  vim.fn.setreg("+", text)
  vim.notify("Copied " .. text)
end

local function current_line_location(modifier)
  copy_location(buffer_location(vim.fn.line("."), vim.fn.line("."), modifier))
end

local function visual_range_location(modifier)
  local start_line = vim.fn.line("v")
  local end_line = vim.fn.line(".")
  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end
  copy_location(buffer_location(start_line, end_line, modifier))
end

function M.setup()
  vim.keymap.set("n", "Y", function()
    current_line_location()
  end, { desc = "Copy file location" })

  vim.keymap.set("n", "<D-Y>", function()
    current_line_location(":p")
  end, { desc = "Copy absolute file location" })

  vim.keymap.set("x", "Y", function()
    visual_range_location()
  end, { desc = "Copy file location range" })

  vim.keymap.set("x", "<D-Y>", function()
    visual_range_location(":p")
  end, { desc = "Copy absolute file location range" })

  vim.keymap.set("n", "<leader>cb", function()
    copy_location(buffer_path())
  end, { desc = "Copy relative file path" })

  vim.keymap.set("n", "<leader>cB", function()
    copy_location(buffer_path(":p"))
  end, { desc = "Copy absolute file path" })
end

return M
