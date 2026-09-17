return {
  "mason-org/mason.nvim",
  opts = function(_, opts)
    -- C++ and Rust extras both request codelldb.
    opts.ensure_installed = LazyVim.dedup(opts.ensure_installed or {})
  end,
}
