return {
  "kndndrj/nvim-dbee",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  cmd = { "Dbee", "Dbee execute", "Dbee toggle" },
  keys = {
    {
      "<leader>D",
      function()
        require("dbee").toggle()
      end,
      desc = "Dbee Toggle",
    },
  },
  build = function()
    -- curl / wget / go — 若失败可 :lua require("dbee").install("go")
    require("dbee").install()
  end,
  config = function()
    require("dbee").setup({
      default_connection = "local-sqlite",
      sources = {
        -- persistence.json 里任一连接连不上会导致整个文件里的连接都加载失败
        require("dbee.sources").FileSource:new(vim.fn.stdpath("state") .. "/dbee/persistence.json"),
        require("dbee.sources").EnvSource:new("DBEE_CONNECTIONS"),
      },
    })
  end,
}
