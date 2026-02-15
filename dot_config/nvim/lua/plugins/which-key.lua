return {
  "folke/which-key.nvim",
  event = "VeryLazy",

  opts = {
    preset = "modern",
    spec = {
      {
        { "<leader>k", group = "sidekick" },
      },
    },
  },
}
