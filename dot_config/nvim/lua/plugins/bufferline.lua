return {
  {
    "akinsho/bufferline.nvim",
    enabled = true,
    opts = {
      options = {
        custom_filter = function(buf, buf_nums)
          -- Only show the current buffer
          return buf == vim.api.nvim_get_current_buf()
        end,
      },
    },
  },
}
