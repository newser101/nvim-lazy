-- https://github.com/loctvl842/nvim/blob/master/lua/tvl/core/resources/editor.lua
return {
    'nvim-telescope/telescope.nvim', version=false,
--    'nvim-telescope/telescope.nvim', tag = '0.1.1',
-- or                              , branch = '0.1.1',
--    lazy=true,
    dependencies={
      'nvim-lua/plenary.nvim'
    },
config = function ()
  ------ keymaps moved to /lua/config/keymaps.lua 
--local builtin= require('telescope.builtin')
--  vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
--  vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
--  vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
--  vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

local actions = require("telescope.actions") -- used for defaults-mapping
local action_layout=require("telescope.actions.layout")-- used for toogle preview defaults-mapping

require('telescope').setup({
defaults={
--   prompt_prefix = " ",
--   selection_caret = " ",
--   path_display = { "smart" },

  mappings={
    -- TODO: TODOtelescope mapping
    i={
      ["<C-c>"] = actions.close,
      ["<M-p>"] = action_layout.toggle_preview, -- toogle preview
    },
    n = {
        ["<M-p>"] = action_layout.toggle_preview, -- toogle preview
      },
  }
},
pickers={
  find_files={
    theme='dropdown'
  },
},
  })
end
    }
