-- https://github.com/Alexis12119/nvim-config/tree/main/lua/plugins/lsp
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/lsp/init.lua
return {
  -- lspconfig
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" }, -- note check
  cmd = { "LspInfo", "LspInstall", "LspUninstall" },
--  lazy=true,  -- NOTE: check 
config = function()
  require("plugins.lsp.handlers").setup()
end,
  dependencies = {
--      { "folke/neoconf.nvim", cmd = "Neoconf", config = true }, -- NOTE: produce an error in healthcheck 
     -- IMPORTANT: make sure to setup neodev BEFORE lspconfig
     { "folke/neodev.nvim", opts = {} },
     "hrsh7th/cmp-nvim-lsp",

-- then setup your lsp server as usual
-- local lspconfig = require('lspconfig').....

  },
}
