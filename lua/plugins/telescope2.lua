-- https://github.com/loctvl842/nvim/blob/master/lua/tvl/core/resources/editor.lua
return {
  "nvim-telescope/telescope.nvim",
  -- version=false,
  --    'nvim-telescope/telescope.nvim', tag = '0.1.1',
  branch = "0.1.x",
  --    lazy=true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  keys={
    {"<leader>pp",
    function() require("telescope.builtin").find_files({cwd=require("lazy.core.config").options.root}) end
    },
  },
  enabled = true,

  config = function()
    local actions = require("telescope.actions")            -- used for defaults-mapping
    local action_layout = require("telescope.actions.layout") -- used for toogle preview defaults-mapping

    require("telescope").setup({
      extensions = {
        fzf = {
          fuzzy = true,              -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case",  -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
      },
    })

    require("telescope").load_extension("fzf")
  end,
}
