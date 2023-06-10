-- https://github.com/Alexis12119/nvim-config/tree/main/lua/plugins/lsp
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/lsp/init.lua
return {
  -- lspconfig
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" }, -- note check
  cmd = { "LspInfo", "LspInstall", "LspUninstall" },
--  lazy=true,  -- NOTE: check 
--  config = function ()
--    require("plugins.lsp.handlers").setup()
--  end,
  dependencies = {
--      { "folke/neoconf.nvim", cmd = "Neoconf", config = true }, -- NOTE: produce an error in healthcheck 
     -- IMPORTANT: make sure to setup neodev BEFORE lspconfig
     { "folke/neodev.nvim", opts = {} },
     "hrsh7th/cmp-nvim-lsp",

-- then setup your lsp server as usual
-- local lspconfig = require('lspconfig').....

  },
  config = function()
    callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    local keym=vim.keymap.set
    keym('n','gi', vim.lsp.buf.implementation,opts)
--    keym('n', 'K', vim.lsp.buf.hover, opts)
  end

    local lspconfig=require('lspconfig')
    lspconfig.pyright.setup{}
    lspconfig.lua_ls.setup{
       settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
              version = 'LuaJIT',
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = {'vim'},
            },
            workspace = {
              checkThirdParty = false,  -- dissable conf env as 'luv'
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
              enable = false,
            },
          },
        },
    }
  end,
  opts = {
    -- diagnostics = {
    --
    -- },
    -- capabilities = {},
    -- Automatically format on save
    -- autoformat = true,
    -- Enable this to show formatters used in a notification
    -- Useful for debugging formatter issues
    on_attach=require("plugins.lsp.keymaps").on_attach,

  }
}
