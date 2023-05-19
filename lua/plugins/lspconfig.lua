return {
  -- lspconfig
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  lazy=true,  -- NOTE: check 
  dependencies = {
     { "folke/neoconf.nvim", cmd = "Neoconf", config = true }, -- NOTE: check documentation
     { "folke/neodev.nvim", config=true }, -- NOTE: check documentation
--     "williamboman/mason.nvim",
--     "williamboman/mason-lspconfig.nvim",
     "hrsh7th/cmp-nvim-lsp", -- NOTE: check documentation
  },
  -- TODO: clean up code 
  -----------config------------
  config = function()

  local lspconfig=require('lspconfig')
  lspconfig.pyright.setup{} -- TODO: buil serverlist in config
  lspconfig.lua_ls.setup{
settings = {
            Lua = {
              workspace = {   -- NOTE: need for 'luv' bug
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
              telemetry = {
      enable = false
    },
            },
          },
  }

  end,
}
