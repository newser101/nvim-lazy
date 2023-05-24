return{
'windwp/nvim-autopairs',
dependencies={
  'hrsh7th/nvim-cmp',
},

config = function()
require "nvim-autopairs".setup{
  disable_filetype = { "TelescopePrompt", "spectre_panel" },  -- "vim" , "
  enable_check_bracket_line = false,
  ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
  -- ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=], -- orig
  enable_afterquote = true,  -- add bracket pairs after quote
  enable_moveright = true,
  disable_in_macro = false,   --- disable when recording or executing a macro
  map_bs = true,  -- map the <BS> key
  map_c_w = false,    --- map <c-w> to delete a pair if possible
  disable_in_visualblock = false,   -- disable when insert after visual block mode
  --- fast_wrap
  fastwrap={
      map = "<M-e>",
      chars = { "{", "[", "(", '"', "'" },
      pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
      offset = 0, -- Offset from pattern match
      end_key = "$",
      --end_key = "-",
      keys = "qwertyuiopzxcvbnmasdfghjkl",
      check_comma = true,
      highlight = "Search",
      highlight_grey = "Comment",
    },

-- TODO: insert treesitter:
-- You can use treesitter to check for a pair.
-- https://github.com/windwp/nvim-autopairs#treesitter
}
-------You need to add mapping `CR` on nvim-cmp setup-------
local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { })
--cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })

end,
}
