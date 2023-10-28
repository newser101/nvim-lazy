return {
  "lukas-reineke/indent-blankline.nvim",
  version="2.20.x",
  enabled=true,

  config = function()

    require("indent_blankline").setup({
      show_end_of_line = true,

      ----- lunarnvim settings -----
      char = "▏",
      show_trailing_blankline_indent = false,
      show_first_indent_level = true,
      use_treesitter = true,
      show_current_context = true,
      buftype_exclude = { "terminal", "nofile" },
      filetype_exclude = {
        "help",
        "packer",
        "NvimTree",
      },
    })
  end,
}
