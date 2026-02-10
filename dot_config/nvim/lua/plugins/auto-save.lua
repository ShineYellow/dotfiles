return {
  "okuuva/auto-save.nvim",
  event = { "InsertLeave", "TextChanged" },
  opts = {
    enabled = true,
    execution_message = {
      enabled = false, -- Don't show "AutoSave: saved at ..." messages
    },
    trigger_events = {
      immediate_save = { "BufLeave", "FocusLost" },
      defer_save = { "InsertLeave", "TextChanged" },
    },
    debounce_delay = 1000, -- Wait 1s after typing stops
  },
}
