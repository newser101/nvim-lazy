-- https://github.com/akinsho/bufferline.nvim
return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"famiu/bufdelete.nvim",
	},
	event = { "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },

	config = function()
		vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
		require("bufferline").setup({
			options = {
				-- INFO: :h bufferline-configuration
				numbers = "ordinal", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
				close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
				right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
				left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
				buffer_close_icon = "",
				-- close_icon = "",
				max_name_length = 30,
				max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
				tab_size = 21,
        -- INFO :h bufferline-diagnostics
				diagnostics = "nvim_lsp", -- | "nvim_lsp" | "coc" | false

				persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
				always_show_bufferline = true,
			},
		})
	end,
}
