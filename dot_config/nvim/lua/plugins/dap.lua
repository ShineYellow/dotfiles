return {
  "mfussenegger/nvim-dap",
  optional = true,
  opts = function()
    local dap = require("dap")
    -- macOS: /tmp,/var,/etc are symlinks to /private/*.
    -- Neovim uses the realpath; DWARF keeps the symlink path.
    local sourceMap = {
      ["/tmp"] = "/private/tmp",
      ["/var"] = "/private/var",
      ["/etc"] = "/private/etc",
    }

    -- ponytail: single-file clang/clang++; cmake --build when the project has CMakeLists.txt
    local function exe_of_current_file()
      local ft = vim.bo.filetype
      if ft ~= "c" and ft ~= "cpp" then
        error("Not a C/C++ buffer")
      end

      vim.cmd.update()

      local src = vim.fn.expand("%:p")
      local exe = vim.fn.stdpath("cache") .. "/cpp-debug/" .. vim.fn.expand("%:t:r")
      vim.fn.mkdir(vim.fn.fnamemodify(exe, ":h"), "p")

      local compiler = ft == "c" and "clang" or "clang++"
      local std = ft == "c" and "-std=c17" or "-std=c++20"
      local result = vim.system({ compiler, std, "-g", "-O0", src, "-o", exe }, { text = true }):wait()
      if result.code ~= 0 then
        local msg = (result.stderr or "") .. (result.stdout or "")
        vim.notify(msg, vim.log.levels.ERROR, { title = "C++ compile" })
        error("Compile failed:\n" .. msg)
      end
      return exe
    end

    local build_debug = {
      name = "Build & Debug current file",
      type = "codelldb",
      request = "launch",
      program = exe_of_current_file,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
      sourceMap = sourceMap,
    }

    for _, lang in ipairs({ "c", "cpp" }) do
      local configs = dap.configurations[lang] or {}
      table.insert(configs, 1, build_debug)
      dap.configurations[lang] = configs
      for _, cfg in ipairs(configs) do
        cfg.sourceMap = vim.tbl_extend("keep", cfg.sourceMap or {}, sourceMap)
      end
    end
  end,
}
