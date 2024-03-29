local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(vim.env.LAZY or lazypath) -- from LazyVim/starter
-- vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct

-- require("lazy").setup("plugins",{  -- orig
require("lazy").setup({
	spec = {
		-- { "LazyVim/LazyVim", import = "lazyvim.plugins" },  -- from Lazyvim/starter
		{ import = "plugins" },
		--    { import = "lazyvim.plugins.extras.coding.copilot" },
	},
	--defaults = {
	--		lazy = true,
	--		version = "*", -- try installing the latest stable version for plugins that support semver
	--	},
	--  install = { colorscheme = { "tokyonight", "habamax" } },
	checker = { enabled = false }, -- automatically check for plugin updates
	debug = false,
	change_detection = {
		notify = false,
		enable = true,
	},
	performance = {
		rtp = {
			-- disable some rtp plugins
			disabled_plugins = {
				--        	"gzip",
				--        	"matchit",
				--        	"matchparen",
				--        	"netrwPlugin",
				--        	"tarPlugin",
				--        	"tohtml",
				--          "tutor",
				--        	"zipPlugin",
			},
		},
	},
})
