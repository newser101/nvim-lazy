return{
'windwp/nvim-autopairs',
 
config = function()
require "nvim-autopairs".setup{
    fastwrap={
      map = "<M-e>",
      chars = { "{", "[", "(", '"', "'" },
      pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
      offset = 0, -- Offset from pattern match
      end_key = "$",
      keys = "qwertyuiopzxcvbnmasdfghjkl",
      check_comma = true,
      highlight = "PmenuSel",
      highlight_grey = "LineNr",
    },

  disable_filetype = { "TelescopePrompt", "spectre_panel" },  -- "vim" , "
-- TODO insert treesitter:
-- You can use treesitter to check for a pair.
}
end,
}
