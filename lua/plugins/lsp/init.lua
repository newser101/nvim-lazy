-- https://alpha2phi.medium.com/neovim-for-minimalists-lsp-and-completion-ce7131f3b56a
return {
---------  var 1 -------------
    {"williamboman/mason.nvim", 
--    build=":MasonUpdate",
--      cmd = "Mason",
    event = "BufReadPre", 
--    event = { "BufReadPre", "BufNewFile" },
   dependencies={
--     "williamboman/mason-lspconfig.nvim",  -- NOTE: check documentation
--     "neovim/nvim-lspconfig",
--     lazy=true,
   },
   },

--   ---------  var 2 -------------
--   {
--    "neovim/nvim-lspconfig",
--    event = { "BufReadPre", "BufNewFile" },
--    dependencies = {
--      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
--      { "folke/neodev.nvim", opts = {} },
--      "mason.nvim",
--      "williamboman/mason-lspconfig.nvim",
--      {
--        "hrsh7th/cmp-nvim-lsp",
--        cond = function()
--          return require("lazyvim.util").has("nvim-cmp")
--        end,
--      },
--    },

    ----------  var END ------------
-- order
-- mason.nvim
-- mason-lspconfig.nvim
-- Setup servers via lspconfig
local settings={
  log_level=vim.log.levels.INFO,
  max_concurrent_installers=4,
}
-----------config------------
----------- setup ------------
config = function()
require("mason").setup(settings)
--require('mason-lspconfig').setup{
----  ensure_installed={"lua_ls"},
--}
 end,
}
