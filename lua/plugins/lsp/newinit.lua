-- https://alpha2phi.medium.com/neovim-for-minimalists-lsp-and-completion-ce7131f3b56a
return {

---------  var 1 -------------

    {"williamboman/mason.nvim", 
    build=":MasonUpdate",
--      cmd = "Mason",
   event ="BufReadPre",
   
   dependencies={
     "williamboman/mason-lspconfig.nvim",  -- NOTE: check documentation
     opts={
        ensure_installed={"lua_ls",}
        },
     "neovim/nvim-lspconfig",
     lazy=true,
   },
   },

   ---------  var 2 -------------
   {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      { "folke/neodev.nvim", opts = {} },
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      {
        "hrsh7th/cmp-nvim-lsp",
        cond = function()
          return require("lazyvim.util").has("nvim-cmp")
        end,
      },
    },

    ----------  var END ------------
-- order
-- mason.nvim
-- mason-lspconfig.nvim
-- Setup servers via lspconfig



config = function()
    
    
end-----------config------------
--config=function() 
----------- setup ------------
--require("mason").setup()
--require('mason-lspconfig').setup{
--  ensure_installed={
--    "lua_ls",
--  },



--
--  })

-- end,
}
