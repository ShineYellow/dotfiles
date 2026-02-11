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
