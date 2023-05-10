return{
"nvim-lualine/lualine.nvim",
  event = "VeryLazy",


config = function()
-- functions for setup
  local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}
local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = false,
	always_visible = true,
} 
local mode = {
	"mode",
	fmt = function(str)
		return "-- " .. str .. " --"
	end,
}
local icons=require("config.icons")
local diff = {
	"diff",
	colored = true,
--	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  symbols = icons.difflualine,
  
  cond = hide_in_width,
  diff_color = {
        -- Same color values as the general color option can be used here.
        added    = 'DiffAdd',    -- Changes the diff's added color
        modified = 'DiffChange', -- Changes the diff's modified color
        removed  = 'DiffDelete', -- Changes the diff's removed color you
      },
}
local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end
local filetype = {
	"filetype",
  colored = true,
  icon_only = false,
	--icons_enabled = false,
	--icon = nil,
}
local location = {
	"location",
	padding = 0,
}

local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end

-- setup lualine
require('lualine').setup{

  options = {
		icons_enabled = true,
		theme = "auto",
		-- theme = "onedark",
		component_separators = { left = "", right = "<" },
		section_separators = { left = "", right = "|" },
		--disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		disabled_filetypes = { "alpha", "dashboard", },
		always_divide_middle = true,
	},

  sections = {
		-- lualine_a = { branch, diagnostics },
		lualine_a = {'mode'},
		lualine_b = {'branch'},
		lualine_c = {'diagnostics'},
		-- lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_x = { diff, spaces, filetype },
		lualine_y = { 'location' },
		lualine_z = { 'progress' },
  },

}
end,
}
