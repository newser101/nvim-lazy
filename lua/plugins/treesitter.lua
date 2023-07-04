return {
  "nvim-treesitter/nvim-treesitter",
  version = "*",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },

  enabled = true,
  ------ minimum setup BEGINN -------
  config = function()
    --- FIX: the message: nvim-treesitter.ts_utils.is_in_node_range is deprecated: use vim.treesitter.is_in_node_range
    local ts_utils = require("nvim-treesitter.ts_utils")
    ts_utils.is_in_node_range = vim.treesitter.is_in_node_range

    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "bash", "python" },
      ignore_installed = { "" },
      sync_installed = false,

      highlight = {
        enable = true,
        --        disable={"css"},
      },

      indent = {
        enable = true,
        disable = { "python" },
      },

      autopairs=true,
    })
  end,
  ------ minimum setup END -------
}
