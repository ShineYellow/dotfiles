return {
  "mrcjkb/rustaceanvim",
  opts = {
    server = {
      on_attach = function(_, bufnr)
        vim.keymap.set("n", "<leader>cD", function()
          vim.cmd.RustLsp("openDocs")
        end, { desc = "open rust docs", buffer = bufnr })
      end,
    },
  },
}
