return {
  "folke/todo-comments.nvim",
-- TODO:  cmd = { "TodoTelescope"},  -- "TodoTrouble", "TodoTelescope" 
  cmd = { "TodoTelescope","TodoTrouble"},  -- "TodoTrouble", "TodoTelescope" 
  event = { "BufReadPost", "BufNewFile" },
  -- config = true,
  -- stylua: ignore
  keys = {
    { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
    { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
    { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
    { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
  },
  config =function ()
    local todo = require('todo-comments')
    todo.setup{
      ------
      gui_style = {
      fg = "NONE", -- The gui style to use for the fg highlight group.
      bg = "BOLD", -- The gui style to use for the bg highlight group.
    },
    --------------
      keywords={
        todo = { icon = " ", color = "info" }, -- added todo to keywords
        note = { icon = " ", color = "hint", alt = { "INFO" } },
      },
      highlight={
        pattern = [[.*<(KEYWORDS)\s*]], -- removed : neede to detect [[.*<(KEYWORDS)\s*:]]
      },
      search={
        pattern = [[\b(KEYWORDS)\b]], -- removed : neede to detect [[.*<(KEYWORDS)\s*:]]
      }

    }
  end
}
-- TODO:
-- HACK:
-- WARN:
-- PERF:
-- NOTE:
-- TEST:
-- TODO 
-- todo 
-- note
-- FIX
-- NOTE
-- todo
