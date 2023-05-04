return {
    'folke/tokyonight.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    --opts = { style = "day"},
    config = function()
      local tokyonight = require "tokyonight"
      tokyonight.setup{
        style="storm",
      }
      tokyonight.load()

      --vim.cmd([[colorscheme tokyonight]])
    end,
    }


-- Todo
-- for lualine:
-- require('lualine').setup {
--     options = {
--       -- ... your lualine config
--       theme = 'tokyonight'
--       -- ... your lualine config
--     }
--   }