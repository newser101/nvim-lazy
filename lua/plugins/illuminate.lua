return {
  "RRethy/vim-illuminate",
  event = "VeryLazy",
  enable = true,

  ------------ config ----------------
  config = function()
    vim.g.Illuminate_ftblacklist = { "alpha", "NvimTree" }
    ---- set keymaps ----
    local keymap=vim.keymap.set
    local opts={noremap=true}
    keymap("n","<a-n>",'<cmd>lua require"illuminate".next_reference{wrap=true}<cr>',opts)
    keymap("n","<a-p>",'<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>',opts)
    ------------- setup -------------
    require('illuminate').configure({
      providers = {
        "lsp",
        "treesitter",
        "regex",
      },
      delay = 100,
      filetypes_denylist = {
        "dirvish",
        "fugitive",
        "alpha",
        "NvimTree",
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
      filetypes_allowlist = {},
      modes_denylist = {},
      modes_allowlist = {},
      providers_regex_syntax_denylist = {},
      providers_regex_syntax_allowlist = {},
      under_cursor = true,

    })
  end
}
