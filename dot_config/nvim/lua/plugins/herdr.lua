return {
  "ChmaraX/herdr-nvim",
  opts = { keymaps = false },
  keys = {
    { "<leader>ac", "<Cmd>Herdr comment<CR>", mode = { "n", "x" }, desc = "Herdr comment" },
    { "<leader>al", "<Cmd>Herdr list<CR>", desc = "Herdr list comments" },
    { "<leader>as", "<Cmd>Herdr send<CR>", desc = "Herdr send comments" },
    { "<leader>aS", "<Cmd>Herdr submit<CR>", desc = "Herdr submit comments" },
  },
}
