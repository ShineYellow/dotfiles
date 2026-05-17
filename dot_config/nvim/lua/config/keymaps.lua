-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

require("config.features.terminal").setup()

require("config.features.vscode_tasks").setup()
require("config.features.copy_location").setup()

-- 复制粘贴快捷键
vim.keymap.set("v", "<D-c>", '"+y') -- GUI用
vim.keymap.set("n", "<D-v>", '"+p')
