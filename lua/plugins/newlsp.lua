-- https://blog.codeminer42.com/configuring-language-server-protocol-in-neovim/
return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
    { "folke/neodev.nvim",  opts = {} },
    "hrsh7th/cmp-nvim-lsp",
  },
  keys = {
    { "<leader>K", vim.lsp.buf.hover,{buffer=0} }
  },
  config = function()
    local cmp_nvim_lsp = require "cmp_nvim_lsp"
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

    local lspconfig = require('lspconfig')
    local lua_ls_settings = require("config.lsphandlers").newlsp_lua_ls_settings

    lspconfig.lua_ls.setup {
      on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
      end,
      settings = lua_ls_settings,
    }
  end
}
