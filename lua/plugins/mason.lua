return {
    {"williamboman/mason.nvim", -- NOTE: check documentation
      -- build=":MasonUpdate"
--      cmd = "Mason",
  opts={
  ensure_installed={"lua_ls",}
  },
      event ="BufReadPre",
      dependencies={
        "williamboman/mason-lspconfig.nvim",  -- NOTE: check documentation
        lazy=true,
      },
      },  
    
--  keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },  -- NOTE: check if needed

  -----------config------------
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

