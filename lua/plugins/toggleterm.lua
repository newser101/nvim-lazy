return {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
  config = function()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "horizontal", -- 'vertical' | 'horizontal' | 'tab' | 'float',
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
      },
    })

    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
    local pythonrunfile = Terminal:new({ cmd = "python %", hidden = true })

    function Lazygit_toggle()
      lazygit:toggle()
    end

    function Runpythonfile_toggle()
      pythonrunfile:toggle()
    end

    local python = Terminal:new({ cmd = "python3", hidden = true })

    function _PYTHON_TOGGLE()
      python:toggle()
    end

    vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua Lazygit_toggle()<CR>", { noremap = true, silent = true })
  end,
}