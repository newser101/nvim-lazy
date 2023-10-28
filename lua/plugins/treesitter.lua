return {
  "nvim-treesitter/nvim-treesitter",
  version = false, -- took from LazyVim
  -- version = "*", -- not in treesitter docs
  build = ":TSUpdate",
  event = { "VeryLazy" }, -- took from Lazyvim, orig: event = { "LazyFile", "VeryLazy" },
  -- event = { "BufReadPost", "BufNewFile" },  -- took from chris@machine
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "windwp/nvim-ts-autotag",
  },

  -- enabled = true,
  ------ minimum setup BEGINN -------
  config = function()
    local ts_utils = require("nvim-treesitter.ts_utils")
    ts_utils.is_in_node_range = vim.treesitter.is_in_node_range

    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "bash", "python", "vim", "vimdoc" },
      -- ignore_installed = { "" },
      sync_install = false,
      auto_install = true,

      -- ------------------------------------------------
      -- Modules:
      -- Highlight
      highlight = {
        enable = true,
        --        disable={"c"},
      },

      -- Increment selection
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>", -- set to `false` to disable one of the mappings
          node_incremental = "<C-space>",
          -- scope_incremental = "grc",
          -- node_decremental = "grm",
        },
      },

      -- Indentation
      indent = {
        enable = true,
        -- disable = { "python" },
      },

      -- add  for: "JoosepAlviste/nvim-ts-context-commentstring",
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },

      -- add for: https://github.com/windwp/nvim-ts-autotag
      autotag = {
        enable = true,
      },

      -- add for: "nvim-treesitter/nvim-treesitter-textobjects",
      textobjects = {
        -- Text objects: select
        select = {
          enable = true,
          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,
          keymaps = {
            -- my keymaps:
            ["aa"] = { query = "@parameter.outer", desc = "Select outer part of parameter" },
            ["ia"] = { query = "@parameter.inner", desc = "Select inner part of parameter" },
            ["af"] = { query = "@function.outer", desc = "Select outer part of function" },
            ["if"] = { query = "@function.inner", desc = "Select inner part of function" },
            ["ac"] = { query = "@class.outer", desc = "Select outer part of class" },
            ["ic"] = { query = "@class.inner", desc = "Select inner part of class" },
            ["ii"] = "@conditional.inner",
            ["ai"] = "@conditional.outer",
            ["il"] = "@loop.inner",
            ["al"] = "@loop.outer",
            ["at"] = "@comment.outer",
            -- orig keymaps and desc goto:
            -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects#text-objects-select
          },
          include_surrounding_whitespace = true,
        },
        -- Text objects: move
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = "@class.outer",
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]["] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[]"] = "@class.outer",
          },
          -- goto_next = {
          --   [']i'] = "@conditional.inner",
          -- },
          -- goto_previous = {
          --   ['[i'] = "@conditional.inner",
          -- }
        },
        -- Text objects: swap
        swap = {
          enable = true,
          swap_next = {
            ["<leader>a"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>A"] = "@parameter.inner",
          },
        },
        -- Text objects: LSP interop
        lsp_interop = {
          enable = true,
          border = "none",
          floating_preview_opts = {},
          peek_definition_code = {
            ["<leader>df"] = "@function.outer",
            ["<leader>dF"] = "@class.outer",
          },
        },
      },
      -- -------------- End Modules --------------------------

      -- autopairs = true, -- TODO: check if needed maybe autopairs.lua
    })
  end,
  ------ minimum setup END -------
}
