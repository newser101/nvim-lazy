return {
  "famiu/bufdelete.nvim",
  "BurntSushi/ripgrep",

  {
    "nvim-lua/plenary.nvim",
    version = "*",
  },

  {
    "simrat39/symbols-outline.nvim",
    opts = {},
    keys = {
      { "<leader>tt", "<cmd>SymbolsOutline<CR>", desc = "Toggle symbols " },
    },
  },
  -- Lua
  {
    "folke/twilight.nvim",
    -- Twilight: toggle twilight
    -- TwilightEnable: enable twilight
    -- TwilightDisable: disable twilightjk
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  -- Lua
  {
    "folke/zen-mode.nvim",
    -- Toggle Zen Mode with :ZenMode
    opts = {
      options={
        number=true,
      }
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}
