return {
	"folke/tokyonight.nvim",
	-- "catppuccin/nvim",
	-- name = "catppuccin",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	--    opts={},
	--    opts = { style = "day"},
	config = function()
		-- vim.cmd.colorscheme("tokyonight") -- use for tokyonight
		vim.cmd.colorscheme("tokyonight-night") -- use for tokyonight
		-- vim.cmd.colorscheme("catppuccin") -- use for catppuccin
		-- vim.cmd.colorscheme("catppuccin-mocha") -- use for catppuccin
	end,
}
