-- https://github.com/loctvl842/nvim/blob/master/lua/tvl/core/resources/editor.lua
return {
	"nvim-telescope/telescope.nvim",
	-- version=false,
	--    'nvim-telescope/telescope.nvim', tag = '0.1.1',
	branch = "0.1.x",
	--    lazy=true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	enabled = true,

	config = function()
		local actions = require("telescope.actions")
		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<C-p>"] = false,
						["<C-n>"] = false,
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
					},
				},
        theme="dropdown",
			},
			pickers = {
				-- find_files = {
				-- 	mappings = {
				-- 		i = {
				-- 			["<C-p>"] = false,
				-- 			["<C-n>"] = false,
				-- 			["<C-k>"] = actions.move_selection_previous,
				-- 			["<C-j>"] = actions.move_selection_next,
				-- 			["jk"] = "close",
				-- 		},
				-- 	},
				-- 	theme = "dropdown",
				-- },
			},
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
			},
		})

		require("telescope").load_extension("fzf")
	end,
}
