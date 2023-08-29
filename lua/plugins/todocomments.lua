return {
	"folke/todo-comments.nvim",
	-- TODO: add todo to snippets
	cmd = { "TodoTelescope", "TodoTrouble" }, -- "TodoTrouble", "TodoTelescope"
	event = { "BufReadPost", "BufNewFile" },
  -- config = true,
  -- stylua: ignore
  keys = {
    { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
    { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
  },
	config = function()
		local todo = require("todo-comments")
		todo.setup({
			highlight = {
				pattern = [[.*<(KEYWORDS)\s*]], -- removed : neede to detect [[.*<(KEYWORDS)\s*:]]
			},
			search = {
				pattern = [[\b(KEYWORDS)\b]], -- removed : neede to detect [[.*<(KEYWORDS)\s*:]]
			},
		})
	end,
}
--TODO:
--HACK:
--WARN:
--PERF:
--NOTE:
--TEST:
--TODO
--todo
--note
--FIX
--NOTE
--todo
