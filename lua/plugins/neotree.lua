-- https://github.com/nvim-neo-tree/neo-tree.nvim
-- https://www.lazyvim.org/plugins/editor
return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  cmd = "NeoTree",
  keys = {
    --    { "n", "<leader>f", ":NeoTreeFloatToggle<CR>" },
  },
  --  init = function()
  -- Unless you are still migrating, remove the deprecated commands from v1.x
  --    vim.g.neo_tree_remove_legacy_commands = 1
  --  end,


  config = function()
    require("neo-tree").setup({
      close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab

    })
  end



}
