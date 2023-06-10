return{
  { "nvim-tree/nvim-web-devicons", lazy = true,
opts={default=true}
},
  "famiu/bufdelete.nvim",
  "nvim-lua/plenary.nvim",
  "BurntSushi/ripgrep",
  --- insert indent_blankline ---
  --- insert indent_blankline ---
{
  "RRethy/vim-illuminate",
  event = "VeryLazy",
},
  {'akinsho/toggleterm.nvim',
  event = "VeryLazy",
    config = function ()

--
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "horizontal",  -- 'vertical' | 'horizontal' | 'tab' | 'float',
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
      border = "curved",
  },

    })
    -- todo make keymaps work      
--      -- keymap --
--  function _G.set_terminal_keymaps()
--  -- local opts = {buffer = 0}
--  local opts = {noremap = true}
--  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
--  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
--  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
--  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
--  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
--  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
--vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
--  vim.api.nvim_buf_set_keymap(0,'t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
--end
--vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
---- if you only want these mappings for toggle term use term://*toggleterm#* instead
--vim.cmd('autocmd! TermOpen term://*toggleterm#* set_terminal_keymaps()')
---- keymap END --

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})

  end
},
}
