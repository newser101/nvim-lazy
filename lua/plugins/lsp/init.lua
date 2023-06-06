-- https://github.com/Alexis12119/nvim-config/tree/main/lua/plugins/lsp
return {
  -- lspconfig
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  cmd = { "LspInfo", "LspInstall", "LspUninstall" },
  lazy=true,  -- NOTE: check 
  config = function ()
--   require("plugins.lsp.handlers").setup()
  end,
  dependencies = {
     --{ "folke/neoconf.nvim", cmd = "Neoconf", config = true }, -- NOTE: produce an error in healthcheck 
     { "folke/neodev.nvim",
     event="LspAttach",
     opts = {}, 
     -- IMPORTANT: make sure to setup neodev BEFORE lspconfig
--     ---- just stanadard options
     config = function ()
      require("neodev").setup({
        -- add any options here, or leave empty to use the default settings
      })
     end
-- then setup your lsp server as usual
-- local lspconfig = require('lspconfig').....

   }, -- NOTE: check documentation
--     "williamboman/mason.nvim",
--     "williamboman/mason-lspconfig.nvim",
--     "hrsh7th/cmp-nvim-lsp",  -- in cmp.lua 
  },
  -- TODO: clean up code 

--  ---- old begin ----
--  -----------config------------
--  config = function()
--
--  local lspconfig=require('lspconfig')
--  -------- setup pyright BEGINN ---------------
--  lspconfig.pyright.setup{} -- TODO: buil serverlist in config
--  --
--  -- setup lua_ls -------
--  -- TODO: move to settings file in /lsp
--  lspconfig.lua_ls.setup{
--  settings = {
--          Lua = {
--            workspace = {   -- NOTE: need for 'luv' bug
--              checkThirdParty = false,
--            },
--            completion = {
--              callSnippet = "Replace",
--            },
--            telemetry = {
--        enable = false
--      },
--              },
--            },
--  }
-------------- setup lua_ls END -----------------
--  end,
--  ------ old end -----
}
