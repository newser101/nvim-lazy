-- https://github.com/windwp/nvim-autopairs
return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/nvim-cmp",
  },

  config = function()
    require("nvim-autopairs").setup({
      enable_check_bracket_line = false, -- check bracket in same line
      --
      -- ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=], -- orig
      -- ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""), -- next
      ignored_next_char = "[%w%.]", -- ignore alphanumeric and `.`
      --

      ---- use Treesitter to check for a pair ----
      check_ts = true, -- treesitter integration
      ts_config = {
        lua = { "string", "source" },
        javascript = { "string", "template_string" },
        java = false,
      },

      --- fast_wrap
      --
      --Before        Input                    After
      --------------------------------------------------
      -- (|foobar      <M-e> then press $        (|foobar)
      -- (|)(foobar)   <M-e> then press q       (|(foobar))
      --
      fast_wrap = {},
      -- fastwrap = {
      --   map = "<M-e>",
      --   chars = { "{", "[", "(", '"', "'" },
      --   pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
      --   offset = 0, -- Offset from pattern match
      --   end_key = "$",
      --   --end_key = "-",
      --   keys = "qwertyuiopzxcvbnmasdfghjkl",
      --   check_comma = true,
      --   highlight = "Search",
      --   highlight_grey = "Comment",
      -- },
    })
    -------You need to add mapping `CR` on nvim-cmp setup-------
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp_status_ok, cmp = pcall(require, "cmp")
    if not cmp_status_ok then
      return
    end
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({}))
    --cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
  end,
}
