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
--     "hrsh7th/cmp-nvim-lsp",  -- in cmp.lua 
  },
  -- TODO: clean up code 

  -----------config------------
  config = function()

  local lspconfig=require('lspconfig')
  -------- setup pyright ---------------
  lspconfig.pyright.setup{} -- TODO: buil serverlist in config
  --
  -- setup lua_ls -------
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
------------ setup lua_ls -----------------
  end,
}
