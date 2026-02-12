return {
  "okuuva/auto-save.nvim",
  event = { "InsertLeave", "TextChanged" },
  keys = {
    { "<leader>ba", "<cmd>ASToggle<cr>", mode = "n", desc = "Toggle auto-save" },
  },

  opts = {
    enabled = false,
    trigger_events = {
      immediate_save = { "BufLeave", "FocusLost" },
      defer_save = { "InsertLeave", "TextChanged" },
    },
    -- function that determines whether to save the current buffer or not
    -- return true: if buffer is ok to be saved
    -- return false: if it's not ok to be saved
    condition = function(buf)
      local fn = vim.fn
      local utils = require("auto-save.utils.data")
      local name = vim.api.nvim_buf_get_name(buf)

      -- 排除 *.dbout
      if name ~= "" and name:match("%.dbout$") then
        return false
      end

      if
        fn.getbufvar(buf, "&modifiable") == 1
        and utils.not_in(fn.getbufvar(buf, "&filetype"), { "gitcommit", "markdown", "oil", "TelescopePrompt" })
      then
        return true -- met condition(s), can save
      end
      return false -- can't save
    end,
    debounce_delay = 1000, -- Wait 1s after typing stops
  },


}
