-- https://blog.codeminer42.com/configuring-language-server-protocol-in-neovim/
return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
    { "folke/neodev.nvim",  opts = {} },
    "hrsh7th/cmp-nvim-lsp",
  },
  keys={
    {"<leader>K",vim.lsp.buf.hover}
  },
  config = function()
    local lspconfig = require('lspconfig')
    local lua_ls_settings = require("config.lsphandlers").newlsp_lua_ls_settings

    lspconfig.lua_ls.setup {
      --      on_attach=function ()
      --      end,
      settings = lua_ls_settings
    }
  end
}
