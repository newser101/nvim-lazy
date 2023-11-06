return {
  "RRethy/vim-illuminate",
  event = "VeryLazy",
  enabled = true,

  ------------ config ----------------
  config = function()
    vim.g.Illuminate_ftblacklist = { "alpha", "NvimTree" }
    require("illuminate").configure({
      providers = {
        "lsp",
        "treesitter",
        "regex",
      },
      filetypes_denylist = {
        "dirvish",
        "fugitive",
        "alpha",
        -- "NvimTree",
        "packer",
        "neogitstatus",
        "Trouble",
        "lir",
        "Outline",
        "spectre_panel",
        "toggleterm",
        "DressingSelect",
        "TelescopePrompt",
      },
    })
  end,
}
