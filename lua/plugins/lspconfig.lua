return {

  "neovim/nvim-lspconfig",
  -- lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    -- { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
    -- { "folke/neodev.nvim",  opts = {} },
    -- "hrsh7th/cmp-nvim-lsp",
  },
  -- enabled = true,

  config = function()
    -- TODO: add global keymaps
    -- TODO: capabilities supported by nvim-cmp
    -- TODO: add local keymaps
    -- TODO: https://github.com/neovim/nvim-lspconfig/wiki/Language-specific-plugins

    local lspconfig = require("lspconfig")
    -- list of language servers
    local servers = require("lsp.lspserver")
    -- lspconfig.pyright.setup {}  -- connest to server
    require("lspconfig").pyright.setup {
      on_attach = function()
        print("pyright attached")
        vim.keymap.set('n','K',vim.lsp.buf.hover(), {buffer=0})
      end
    } -- connect to server
    require("lspconfig").lua_ls.setup {
      on_attach = function()
        print("lua attached")
        vim.keymap.set('n','K',vim.lsp.buf.hover(), {buffer=0})
      end
    } -- connect to server
  end
}
