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

vim.keymap.set("n", "<leader>T1", function()
  Snacks.terminal(nil, { cwd = LazyVim.root(), win = { position = "bottom" } })
end, { desc = "Terminal 1" })
vim.keymap.set("n", "<leader>T2", function()
  Snacks.terminal("bash", { cwd = LazyVim.root(), win = { position = "bottom" } })
end, { desc = "Terminal 2" })
