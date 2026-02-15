return {
  {
    "stevearc/overseer.nvim",
    opts = function()
      local overseer = require("overseer")
      overseer.register_template({
        name = "Rust: Run Current Example",
        desc = "Run the current Rust example file with cargo",
        tags = { overseer.TAG.RUN },
        params = {
          release = {
            desc = "Build in release mode",
            type = "boolean",
            default = false,
          },
        },
        condition = {
          filetype = { "rust" },
          callback = function()
            local file = vim.fn.expand("%:p")
            return file:match("/examples/") ~= nil
          end,
        },
        builder = function(params)
          local filename = vim.fn.expand("%:t:r")
          local file_dir = vim.fn.expand("%:p:h")
          -- Walk up from the file to find the nearest Cargo.toml
          local cargo_dir = vim.fs.root(file_dir, "Cargo.toml")
          local args = { "run", "--example", filename }
          if params.release then
            table.insert(args, "--release")
          end
          return {
            cmd = { "cargo" },
            args = args,
            cwd = cargo_dir,
            components = {
              { "open_output", direction = "dock", on_complete = "success" },
              "default",
            },
          }
        end,
      })
    end,
    keys = {
      {
        "<leader>oe",
        function()
          require("overseer").run_template({ name = "Rust: Run Current Example" })
        end,
        desc = "Run Rust Example",
        ft = "rust",
      },
    },
  },
}
