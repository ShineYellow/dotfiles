local function goto_implementation()
  if _G.Snacks and Snacks.picker and Snacks.picker.lsp_implementations then
    return Snacks.picker.lsp_implementations()
  end

  return vim.lsp.buf.implementation()
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ["*"] = {
          keys = {
            { "gI", false },
            { "gi", goto_implementation, desc = "Goto Implementation" },
          },
        },
      },
    },
  },
}
