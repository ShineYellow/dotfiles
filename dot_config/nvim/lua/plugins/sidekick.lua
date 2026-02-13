return {
  "folke/sidekick.nvim",

  -- register which-key bindings
  config = function()
    local wk = require("which-key")
    wk.add({
      { "<leader>k", group = "sidekick" },
    })
  end,

  keys = {
    {
      "<leader>kk",
      function()
        require("sidekick.cli").toggle()
      end,
      desc = "Sidekick Toggle CLI",
    },
    {
      "<leader>kc",
      function()
        require("sidekick.cli").close()
      end,
      desc = "Detach a CLI Session",
    },
    {
      "<leader>ks",
      function()
        require("sidekick.cli").send({ msg = "{this}" })
      end,
      mode = { "x", "n" },
      desc = "Send This",
    },
    {
      "<leader>kf",
      function()
        require("sidekick.cli").send({ msg = "{file}" })
      end,
      desc = "Send File",
    },
    {
      "<leader>kv",
      function()
        require("sidekick.cli").send({ msg = "{selection}" })
      end,
      mode = { "x" },
      desc = "Send Visual Selection",
    },
    {
      "<leader>kp",
      function()
        require("sidekick.cli").prompt()
      end,
      mode = { "n", "x" },
      desc = "Sidekick Select Prompt",
    },
  },
}
