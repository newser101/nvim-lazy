return {
	"folke/trouble.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	Opts = {
		-- my config comes here
    signs=require("config.icons").trouble.signs,
	},
}
