return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",

  opts = {
    indent = {
      char = "│",
      -- char = "┃",
      -- char ="│",
      -- char = "",
      -- tab_char = "│",
      -- highlight = highlight,
      -- highlight = { "Function" },
      -- highlight = { "Function", "Label" },
    },
    scope = {
      enabled = false,
      -- highlight = { "Function","Label" },
      -- highlight = highlight,
    },
    -- exclude = {
    --   filetypes = {
    --     "neo-tree",
    --     "Trouble",
    --     "trouble",
    --     "lazy",
    --     "mason",
    --     "Nvimtree",
    --     "toggleterm",
    --     "lazyterm",
    --   },
    -- },
  },
}
