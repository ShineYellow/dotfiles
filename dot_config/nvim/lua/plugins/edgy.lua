local function close_explorer()
  for _, p in ipairs(Snacks.picker.get({ source = "explorer" })) do
    p:close()
  end
end

return {
  "folke/edgy.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>ue", function() close_explorer() require("edgy").toggle() end, desc = "Edgy Toggle" },
  },
  opts = function(_, opts)
    table.insert(opts.left, 1, {
      title = "Explorer",
      ft = "snacks_layout_box",
      pinned = true,
      size = { height = 0.6 },
      open = function() Snacks.explorer() end,
      wo = { winbar = false },
      filter = function(_, win)
        return vim.w[win].snacks_win and vim.w[win].snacks_win.position == "left"
      end,
    })
    table.insert(opts.left, {
      title = "Symbols",
      ft = "trouble",
      pinned = true,
      size = { height = 0.4 },
      open = "Trouble symbols toggle",
      filter = function(_, win)
        return vim.w[win].trouble and vim.w[win].trouble.mode == "symbols"
      end,
    })
  end,
}
