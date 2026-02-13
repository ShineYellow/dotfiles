return { -- only for lunarvim

  {
    "michaelb/sniprun",
    branch = "master",

    build = "sh install.sh",

    config = function()
      require("sniprun").setup({
        live_mode_toggle = "enable",
        live_display = { "VirtualTextOk" },
      })
    end,
    keys = {
      { "<leader>cn", "<cmd>SnipRun<cr>", mode = "n", desc = "Run sniprun" },
      { "<leader>cn", "<cmd>'<,'>SnipRun<cr>", mode = "v", desc = "Run sniprun (selection)" },
    },
  },
}
