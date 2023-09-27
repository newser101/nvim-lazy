return {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
  config = function()
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
      direction = "horizontal", -- 'vertical' | 'horizontal' | 'tab' | 'float',
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
      },
    })

    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

    function lazygit_toggle()
      lazygit:toggle()
    end

    vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua lazygit_toggle()<CR>", { noremap = true, silent = true })
  end,
}
