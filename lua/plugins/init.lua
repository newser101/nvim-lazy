return{
  { "nvim-tree/nvim-web-devicons", lazy = true,
opts={default=true}
},
  "famiu/bufdelete.nvim",
  "nvim-lua/plenary.nvim",
  "BurntSushi/ripgrep",
  --- insert indent_blankline ---
  --- insert indent_blankline ---
  {'akinsho/toggleterm.nvim',
  config = function ()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
      border = "curved",
  },

    })
  end
},
}
