local M = {}

local function project_root()
  local path = vim.api.nvim_buf_get_name(0)
  path = path ~= "" and path or vim.uv.cwd()
  path = vim.fn.filereadable(path) == 1 and vim.fs.dirname(path) or path

  local marker = vim.fs.find({
    ".git",
    "package.json",
    "go.mod",
    "Cargo.toml",
    "pyproject.toml",
    "Makefile",
  }, { path = path, upward = true })[1]

  if marker then
    return vim.fs.dirname(marker)
  end

  local ok, root = pcall(function()
    return LazyVim.root({ normalize = true })
  end)

  return ok and root or vim.uv.cwd()
end

local function template_dir()
  return vim.fs.joinpath(vim.fn.stdpath("config"), "templates", "vscode-tasks")
end

local function template_path(name)
  return vim.fs.joinpath(template_dir(), name .. ".json")
end

local function template_names()
  local names = {}
  for template in vim.fs.dir(template_dir()) do
    local name = template:match("^(.*)%.json$")
    if name then
      names[#names + 1] = name
    end
  end
  table.sort(names)
  return names
end

local function target_root(target)
  if not target or target == "" or target == "." then
    return project_root()
  end

  if vim.fn.fnamemodify(target, ":p") == target then
    return vim.fs.normalize(target)
  end

  return vim.fs.normalize(vim.fs.joinpath(project_root(), target))
end

local function read_package_scripts(root)
  local package_json = vim.fs.joinpath(root, "package.json")
  if vim.fn.filereadable(package_json) == 0 then
    return nil
  end

  local ok, data = pcall(function()
    return vim.json.decode(table.concat(vim.fn.readfile(package_json), "\n"))
  end)

  if not ok or type(data) ~= "table" or type(data.scripts) ~= "table" then
    return nil
  end

  local scripts = vim.tbl_keys(data.scripts)
  table.sort(scripts)
  return scripts
end

local function q(value)
  return vim.json.encode(value)
end

local function render_task(task, is_last)
  local lines = {
    "    {",
    "      \"label\": " .. q(task.label) .. ",",
    "      \"type\": \"shell\",",
    "      \"command\": " .. q(task.command) .. ",",
  }

  if task.group then
    lines[#lines + 1] = "      \"group\": " .. q(task.group) .. ","
  end

  lines[#lines + 1] = "      \"problemMatcher\": []"
  lines[#lines + 1] = "    }" .. (is_last and "" or ",")
  return lines
end

local function task_group(script)
  if script == "build" then
    return "build"
  end
  if script == "test" then
    return "test"
  end
end

local function build_tasks(root)
  local scripts = read_package_scripts(root)
  if not scripts or #scripts == 0 then
    return nil
  end

  return vim.tbl_map(function(script)
    return {
      label = "npm: " .. script,
      command = "npm run " .. script,
      group = task_group(script),
    }
  end, scripts)
end

local function render_tasks_json(root)
  local tasks = build_tasks(root)
  if not tasks then
    return vim.fn.readfile(template_path("generic"))
  end

  local lines = {
    "{",
    "  \"version\": \"2.0.0\",",
    "  \"tasks\": [",
  }

  for index, task in ipairs(tasks) do
    vim.list_extend(lines, render_task(task, index == #tasks))
  end

  lines[#lines + 1] = "  ]"
  lines[#lines + 1] = "}"
  return lines
end

local function render_template(name, root)
  if not name or name == "" or name == "auto" then
    return render_tasks_json(root)
  end

  local path = template_path(name)
  if vim.fn.filereadable(path) == 0 then
    error("Unknown VS Code task template: " .. name)
  end

  return vim.fn.readfile(path)
end

local function parse_args(args)
  local parts = vim.split(args or "", "%s+", { trimempty = true })
  return {
    template = parts[1],
    target = parts[2],
  }
end

function M.create(opts)
  opts = opts or {}

  local root = target_root(opts.target)
  local vscode_dir = vim.fs.joinpath(root, ".vscode")
  local tasks_file = vim.fs.joinpath(vscode_dir, "tasks.json")

  if vim.fn.filereadable(tasks_file) == 1 and not opts.force then
    vim.notify("Using existing " .. tasks_file, vim.log.levels.INFO)
    vim.cmd.edit(tasks_file)
    return
  end

  vim.fn.mkdir(vscode_dir, "p")
  local ok, lines = pcall(render_template, opts.template, root)
  if not ok then
    vim.notify(lines, vim.log.levels.ERROR)
    return
  end

  vim.fn.writefile(lines, tasks_file)
  vim.notify("Created " .. tasks_file, vim.log.levels.INFO)
  vim.cmd.edit(tasks_file)
end

function M.setup()
  vim.keymap.set("n", "<leader>cT", function()
    M.create()
  end, { desc = "Create VS Code tasks.json" })

  vim.api.nvim_create_user_command("VscodeTask", function(opts)
    local args = parse_args(opts.args)
    M.create({
      force = opts.bang,
      template = args.template,
      target = args.target,
    })
  end, {
    bang = true,
    nargs = "*",
    complete = function(arglead)
      return vim.tbl_filter(function(name)
        return vim.startswith(name, arglead)
      end, vim.list_extend({ "auto" }, template_names()))
    end,
    desc = "Create or open .vscode/tasks.json",
  })

  vim.cmd([[
    cnoreabbrev <expr> vscodeTask getcmdtype() ==# ':' && getcmdline() ==# 'vscodeTask' ? 'VscodeTask' : 'vscodeTask'
  ]])
end

return M
