-- Only these Sidekick CLI profiles stay registered (picker, health, toggles).
-- Edit this set, then restart Neovim.
local CLI_ALLOWLIST = {
  codex = true,
  copilot = true,
  cursor = true,
  gemini = true,
  opencode = true,
  pi = true,
}

return {
  "folke/sidekick.nvim",
  event = "VeryLazy",

  opts = {
    cli = {
      tools = {
        codex = {
          cmd = { "codex", "--yolo" },
        },
        cursor = {
          cmd = { "cursor-agent", "--yolo" },
        },
      },
      mux = {
        enabled = false,
        backend = "zellij",
      },
    },
  },

  config = function(_, opts)
    require("sidekick").setup(opts)
    local tools = require("sidekick.config").cli.tools
    for name in pairs(tools) do
      if not CLI_ALLOWLIST[name] then
        tools[name] = nil
      end
    end
  end,

  keys = function()
    return {
      {
        "<tab>",
        function()
          -- if there is a next edit, jump to it, otherwise apply it if any
          if not require("sidekick").nes_jump_or_apply() then
            return "<Tab>" -- fallback to normal tab
          end
        end,
        expr = true,
        desc = "Goto/Apply Next Edit Suggestion",
      },
      {
        "<c-.>",
        function()
          require("sidekick.cli").focus()
        end,
        desc = "Sidekick Focus",
        mode = { "n", "t", "i", "x" },
      },
      {
        "<leader>aa",
        function()
          require("sidekick.cli").toggle()
        end,
        desc = "Sidekick Toggle CLI",
      },
      {
        "<leader>as",
        function()
          require("sidekick.cli").select()
        end,
        -- Or to select only installed tools:
        -- require("sidekick.cli").select({ filter = { installed = true } })
        desc = "Select CLI",
      },
      {
        "<leader>ad",
        function()
          require("sidekick.cli").close()
        end,
        desc = "Detach a CLI Session",
      },
      {
        "<leader>at",
        function()
          require("sidekick.cli").send({ msg = "{this}" })
        end,
        mode = { "x", "n" },
        desc = "Send This",
      },
      {
        "<leader>ab",
        function()
          require("sidekick.cli").send({ msg = "{file}" })
        end,
        desc = "Send File",
      },
      {
        "<leader>av",
        function()
          require("sidekick.cli").send({ msg = "{selection}" })
        end,
        mode = { "x" },
        desc = "Send Visual Selection",
      },
      {
        "<leader>aP",
        function()
          require("sidekick.cli").prompt()
        end,
        mode = { "n", "x" },
        desc = "Sidekick Select Prompt",
      },
      {
        "<leader>ac",
        function()
          require("sidekick.cli").toggle({ name = "codex" })
        end,
        desc = "Sidekick Toggle codex",
      },
      {
        "<leader>ao",
        function()
          require("sidekick.cli").toggle({ name = "opencode" })
        end,
        desc = "Sidekick Toggle opencode",
      },
      {
        "<leader>ap",
        function()
          require("sidekick.cli").toggle({ name = "pi" })
        end,
        desc = "Sidekick Toggle pi",
      },
    }
  end,
}
