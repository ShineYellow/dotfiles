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
      sources = {
        explorer = {
          hidden = true,
          ignored = true,
          win = {
            list = {
              keys = {
                H = { { "toggle_hidden", "toggle_ignored" }, desc = "Toggle Hidden and Ignored Files" },
                I = false,
              },
            },
          },
        },
      },
    },
  },
}
