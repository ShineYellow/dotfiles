return {
  {
    "CRAG666/code_runner.nvim",
    cmd = { "RunCode", "RunFile", "RunProject", "RunClose" },
    opts = {
      mode = "snacks",
      filetype = {
        cpp = {
          "cd $dir &&",
          "clang++ -std=c++20 -g -O0 $fileName -o /tmp/$fileNameWithoutExt &&",
          "/tmp/$fileNameWithoutExt",
        },
      },
    },
    keys = {
      { "<leader>rr", "<cmd>RunFile<cr>", desc = "Run file" },
    },
  },
}
