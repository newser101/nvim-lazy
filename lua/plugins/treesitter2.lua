return {
	"nvim-treesitter/nvim-treesitter",
	event = "BufReadPost",

	config = function()
    local treesitter=require("nvim-treesitter")
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = { "lua", "vim", "vimdoc", "bash", "python" },
			ignore_install = { "" },
			sync_install = false,
			highlight = {
				enable = true,
				dissable = { "css" },
			},
			-- TODO install nvim-ts-context-commentstring
		})
	end,
}
