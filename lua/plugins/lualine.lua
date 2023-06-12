-- eventually use navic for statusline
-- https://alpha2phi.medium.com/neovim-for-beginners-status-line-dd0c97fba978
return{
"nvim-lualine/lualine.nvim",
  event = "VeryLazy",


  --------------- lualine config --------------------------- 
config = function()
local icons=require("config.icons")
local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}
local diagnostics = {
	"diagnostics",
  -- NOTE: check diff diagnostics 
  -- Table of diagnostic sources, available sources are:
  --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
	sources = { "nvim_diagnostic" },
	-- sections = { "error", "warn" },
	sections = { "error", "warn", "info", "hint" },
	symbols = { error = " ", warn = " ", info ="",hint="" },
  diagnostics_color = {
        -- Same values as the general color option can be used here.
        error = 'DiagnosticError', -- Changes diagnostics' error color.
        warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
        info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
        hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
      },
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
local diff = {
	"diff",
	colored = true,
  symbols = icons.lualine_diff,
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

----------- setup lualine ---------------------
require('lualine').setup{

  options = {
		icons_enabled = true,
		theme = "auto",
		-- theme = "onedark",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
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
