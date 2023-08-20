return {
  "numToStr/Comment.nvim",
  --event = {"BufRead", "BufNewFile"},
  event = "VeryLazy",

  config = function()
    require("Comment").setup()
    -- TODO:  add Treesitter https://github.com/numToStr/Comment.nvim
    -- TODO: change to mini.comment
    -- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-comment.md
  end,
}
