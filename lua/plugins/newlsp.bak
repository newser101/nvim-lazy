-- https://blog.codeminer42.com/configuring-language-server-protocol-in-neovim/
return {
  "neovim/nvim-lspconfig",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
    { "folke/neodev.nvim",  opts = {} },
    "hrsh7th/cmp-nvim-lsp",
  },
  enabled = true,

  config = function()
    local cmp_nvim_lsp = require "cmp_nvim_lsp"
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

    local lspconfig = require('lspconfig')
    local lua_ls_settings = require("config.settings").lsp.lua_ls_settings
    lspconfig.pyright.setup {}
    lspconfig.lua_ls.setup {
      settings = lua_ls_settings,
    }
    local on_attach = function(bufnr)
      local opts = { silent = true, noremap = true }
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufnr)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    end
  end
}
