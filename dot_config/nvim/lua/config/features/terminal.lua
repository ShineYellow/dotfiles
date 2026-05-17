local M = {}

local function current_buffer_dir()
  local name = vim.api.nvim_buf_get_name(0)
  if name == "" then
    return vim.loop.cwd()
  end

  local dir = vim.fn.fnamemodify(name, ":p:h")
  return dir ~= "" and dir or vim.loop.cwd()
end

local function open_buffer_terminal()
  Snacks.terminal(nil, { cwd = current_buffer_dir() })
end

local function pick_terminal_buffers()
  Snacks.picker.buffers({
    hidden = true,
    nofile = true,
    title = "Terminals",
    transform = function(item)
      return item.buftype == "terminal"
    end,
  })
end

local function setup_terminal_buffer_keymaps()
  local buftype = vim.bo.buftype
  local filetype = vim.bo.filetype
  if buftype == "terminal" or filetype == "snacks_terminal" then
    vim.keymap.set("n", "o", function()
      Snacks.terminal.open()
    end, { buffer = true, desc = "Open new Snacks terminal" })
    vim.keymap.set("n", "q", "<cmd>q<cr>", { buffer = true, desc = "Close terminal" })
  end
end

function M.setup()
  -- 用于 terminal 的快捷键, 方便查看日志等
  -- Esc Esc   -> 可翻历史
  -- k/j / /   -> 看日志
  -- i         -> 回终端
  vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], {
    desc = "Exit terminal mode (snacks)",
  })

  vim.keymap.set("n", "<leader>fd", open_buffer_terminal, { desc = "Terminal (Buffer Dir)" })
  vim.keymap.set("n", "\\t", open_buffer_terminal, { desc = "Terminal (Buffer Dir)" })
  vim.keymap.set("n", "<leader>ft", pick_terminal_buffers, { desc = "Pick terminal buffers" })

  vim.api.nvim_create_autocmd("BufEnter", {
    group = vim.api.nvim_create_augroup("UserTerminalKeymaps", { clear = true }),
    callback = setup_terminal_buffer_keymaps,
  })
end

return M
