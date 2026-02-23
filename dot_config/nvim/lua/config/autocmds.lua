-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- notify user when autosave is enabled or disabled
local group = vim.api.nvim_create_augroup("autosave", {})

vim.api.nvim_create_autocmd("User", {
  pattern = "AutoSaveEnable",
  group = group,
  callback = function(opts)
    vim.notify("AutoSave enabled", vim.log.levels.INFO)
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "AutoSaveDisable",
  group = group,
  callback = function(opts)
    vim.notify("AutoSave disabled", vim.log.levels.INFO)
  end,
})

--
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gitcommit" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en_us"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.spell = false
    vim.diagnostic.enable(false)
  end,
})
