local function extract_user_text(content)
  if type(content) == "string" then
    return content
  end

  local parts = {}

  for _, block in ipairs(content or {}) do
    if block.type == "text" and block.text then
      table.insert(parts, block.text)
    end
  end

  return table.concat(parts, "\n")
end

local function load_pi_user_messages()
  local root = vim.fn.expand("~/.pi/agent/sessions")

  if vim.fn.isdirectory(root) ~= 1 then
    vim.notify("Pi session directory not found: " .. root, vim.log.levels.ERROR)
    return {}
  end

  local files = vim.fs.find(function(name)
    return name:match("%.jsonl$") ~= nil
  end, {
    path = root,
    type = "file",
    limit = math.huge,
  })

  local items = {}

  for _, file in ipairs(files) do
    local line_number = 0

    for line in io.lines(file) do
      line_number = line_number + 1

      local ok, entry = pcall(vim.json.decode, line)

      if ok and entry.type == "message" and entry.message and entry.message.role == "user" then
        local text = extract_user_text(entry.message.content)

        if text ~= "" then
          table.insert(items, {
            -- Picker 中用于搜索和显示的文字
            text = text:gsub("[\r\n]+", " "),

            -- 用于预览和跳转
            file = file,
            pos = { line_number, 1 },

            timestamp = entry.timestamp,
          })
        end
      end
    end
  end

  return items
end

local function search_pi_user_messages(initial_pattern)
  Snacks.picker.pick({
    title = "Pi User Messages",
    items = load_pi_user_messages(),

    -- 对 text 字段进行模糊搜索
    pattern = initial_pattern,

    -- 显示文件、行号和消息内容
    format = "file",

    -- 预览原始 session 文件
    preview = "file",

    matcher = {
      fuzzy = true,
      smartcase = true,
      ignorecase = true,
      filename_bonus = false,
    },

    jump = {
      match = true,
    },
  })
end

return {
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<leader>pu",
        function()
          search_pi_user_messages()
        end,
        desc = "Search Pi user messages",
      },
      {
        "<leader>pU",
        function()
          search_pi_user_messages(vim.fn.expand("<cword>"))
        end,
        desc = "Search current word in Pi user messages",
      },
    },
  },
}
