-- Restart last finished task (upstream recipe):
-- https://github.com/stevearc/overseer.nvim/blob/master/doc/recipes.md#restart-last-task

return {
  {
    "stevearc/overseer.nvim",
    opts = {
      disable_template_modules = {
        "overseer.template.make",
        "overseer.template.just",
      },
    },
    config = function(_, opts)
      require("overseer").setup(opts)

      vim.api.nvim_create_user_command("OverseerRestartLast", function()
        local overseer = require("overseer")
        local task_list = require("overseer.task_list")
        local tasks = overseer.list_tasks({
          status = {
            overseer.STATUS.SUCCESS,
            overseer.STATUS.FAILURE,
            overseer.STATUS.CANCELED,
          },
          sort = task_list.sort_finished_recently,
        })
        if vim.tbl_isempty(tasks) then
          vim.notify("No tasks found", vim.log.levels.WARN)
        else
          local most_recent = tasks[1]
          overseer.run_action(most_recent, "restart")
        end
      end, { desc = "Restart the most recent finished overseer task" })
    end,
    keys = {
      {
        "<leader>ol",
        "<cmd>OverseerRestartLast<cr>",
        desc = "Overseer: restart last task",
      },
    },
  },
}
