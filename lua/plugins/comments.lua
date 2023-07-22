return {
  "numToStr/Comment.nvim",
  --event = {"BufRead", "BufNewFile"},
  event = "VeryLazy",

  config = function()
    require("Comment").setup()
    -- TODO:  add Treesitter https://github.com/numToStr/Comment.nvim
  end,
}
