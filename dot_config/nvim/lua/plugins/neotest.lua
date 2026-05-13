local test_filetypes = { "go", "python" }

return {
  {
    "nvim-neotest/neotest",
    ft = test_filetypes,
    keys = {
      {
        "<leader>tt",
        function()
          require("neotest").run.run()
        end,
        desc = "Neotest: run nearest test",
        ft = test_filetypes,
      },
      {
        "<leader>tf",
        function()
          require("neotest").run.run(vim.fn.expand("%"))
        end,
        desc = "Neotest: run file",
        ft = test_filetypes,
      },
      {
        "<leader>ts",
        function()
          require("neotest").summary.toggle()
        end,
        desc = "Neotest: toggle summary",
        ft = test_filetypes,
      },
      {
        "<leader>to",
        function()
          require("neotest").output.open({ enter = true })
        end,
        desc = "Neotest: open output",
        ft = test_filetypes,
      },
    },
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      {
        "nvim-treesitter/nvim-treesitter", -- Optional, but recommended
        branch = "main", -- NOTE; not the master branch!
        build = function()
          vim.cmd(":TSUpdate go")
          vim.cmd(":TSUpdate python")
        end,
      },
      {
        "fredrikaverpil/neotest-golang",
        version = "*", -- Optional, but recommended; track releases
        build = function()
          vim.system({ "go", "install", "gotest.tools/gotestsum@latest" }):wait() -- Optional, but recommended
        end,
      },
      "nvim-neotest/neotest-python",
    },
    config = function()
      local golang_config = {
        runner = "gotestsum", -- Optional, but recommended
      }
      require("neotest").setup({
        adapters = {
          require("neotest-golang")(golang_config),
          require("neotest-python")({
            runner = "pytest",
          }),
        },
      })
    end,
  },
}
