-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- 用于 terminal 的快捷键, 方便查看日志等
-- Esc Esc   → 可翻历史
-- k/j / /   → 看日志
-- i         → 回终端
vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], {
  desc = "Exit terminal mode (snacks)",
})

-- 用于查找terminal
vim.keymap.set("n", "<leader>ft", function()
  Snacks.picker.buffers({
    hidden = true, -- terminal bufs are unlisted
    nofile = true, -- don't exclude by buftype
    title = "Terminals",
    transform = function(item)
      return item.buftype == "terminal"
    end,
  })
end, { desc = "Pick terminal buffers" })

-- In terminal or Snacks terminal buffer: "n" opens a new Snacks terminal
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local buftype = vim.bo.buftype
    local filetype = vim.bo.filetype
    if buftype == "terminal" or filetype == "snacks_terminal" then
      local open_new = function()
        Snacks.terminal.open()
      end
      vim.keymap.set("n", "o", open_new, { buffer = true, desc = "Open new Snacks terminal" })
      vim.keymap.set("n", "q", "<cmd>q<cr>", { buffer = true, desc = "Close terminal" })
    end
  end,
})
