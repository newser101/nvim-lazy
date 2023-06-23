-- https://github.com/nvim-neo-tree/neo-tree.nvim
-- https://www.lazyvim.org/plugins/editor
return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  cmd = "NeoTree",
  versiom = "*",
  keys = {
    { "<leader>e", "<cmd>NeoTreeFocusToggle<cr>", desc = "NeoTreeToggle" },
    { "<leader>f", "<cmd>NeoTreeFloatToggle<cr>", desc = "NeoTree FloatToggle" },
  },
  --  init = function()
  -- Unless you are still migrating, remove the deprecated commands from v1.x
  --    vim.g.neo_tree_remove_legacy_commands = 1
  --  end,


  config = function()
    --      close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
    require("neo-tree").setup({
      --      enabled_git_status = true,
      default_component_configs = {
        git_status = {
          -- todo create nice symbols and/or export symbols to a file
          symbols = {
            renamed   = "󰁕",
            unstaged  = "✖",
            modified  = "✖", -- or "", but this is redundant info if you use git_status_colors on the name
            added     = "✖", -- or "✚", but this is redundant info if you use git_status_colors on the name
            deleted   = "✖✖", -- this can only be used in the git_status source
            --             renamed   = "",-- this can only be used in the git_status source
            -- Status type
            untracked = "",
            ignored   = "",
            --              unstaged  = "",
            staged    = "",
            conflict  = "",
          },
        },
      },
      --      filesystem = {
      --        bind_to_cwd = false,
      --        follow_current_file = true,
      --        use_libuv_file_watcher = true,
      --      },
      --      source_selector = {
--      sources = {
--        "git_status", "filesystem",
--      },
--      --      },
    })
    --    require("neo-tree.sources.git_status").refresh()
  end

}
