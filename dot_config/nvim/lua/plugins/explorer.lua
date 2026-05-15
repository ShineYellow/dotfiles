return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      actions = {
        explorer_focus = function(picker)
          picker:set_cwd(picker:dir())
          picker:find()
          vim.cmd.cd(picker:dir())
        end,
      },
    },
  },
}