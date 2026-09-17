return {
  -- CUE LSP (`cue lsp`), built into the cue CLI
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        cue = {
          -- use system-installed `cue` (e.g. homebrew); not managed by mason
          mason = false,
        },
      },
    },
  },

  -- syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "cue" },
    },
  },

  -- formatting via conform (LazyVim default formatter)
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        cue = { "cue_fmt" },
      },
    },
  },

  -- formatting via none-ls when that extra is enabled
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = vim.list_extend(opts.sources or {}, {
        nls.builtins.formatting.cue_fmt,
      })
    end,
  },
}
