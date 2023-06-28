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
    ---- global kemaps
    -- TODO: customize keymaps
    --    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
    --    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    --    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    --    vim.keymap.set('n', '<space>dq', vim.diagnostic.setloclist)


    --  capabilities supported by nvim-cmp
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

    -- local Keymaps to parse to lsp setup
    local function lsp_keymaps(bufnr)
      local opts = { noremap = true, silent = true }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
      vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
      vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
      vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts)
      vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', '<space>lf', function()
        vim.lsp.buf.format { async = true }
      end, opts)
    end

    local lspconfig = require("lspconfig")
    local servers = {
      "lua_ls",
      "pyright",
    }
--    local settings = {
--      lua_ls = {
--        print("local settings"),
--      Lua = {
--        workspace = {   -- NOTE: need for 'luv' bug
--          checkThirdParty = false,
--        },
--        completion = {
--          callSnippet = "Replace",
--        },
--        telemetry = {
--          enable = false
--        },
--      },
--      },
--      pyright = {
--      },
--    }

    -- create attach to parse
    local on_attach = function(client, bufnr)
      lsp_keymaps(bufnr)
      -- NOTE:check illuminate
      require("illuminate").on_attach(client)
    end

        for _, server in pairs(servers) do
          Opts = {
            on_attach = on_attach,
            capabilities = capabilities,
          }
          server = vim.split(server, "@")[1]
--          print(server)
--          local require_ok, conf_opts = pcall(require, "settings." .. server)
          local require_ok, conf_opts = pcall(require("config.settings").lsp.lua_ls_settings)
          if require_ok then
            Opts = vim.tbl_deep_extend("force", conf_opts, Opts)
          end
          print("settings not loaded")
          lspconfig[server].setup(Opts)
        end
--    ---- to delete BEGINN -----
--    lspconfig.pyright.setup {
--      capabilities = capabilities
--    }
--    lspconfig.lua_ls.setup {
--      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { noremap = true, silent = true }),
--      vim.keymap.set('n', '<space>lf', function()
--        vim.lsp.buf.format { async = true }
--      end, { noremap = true, silent = true }),
--      settings = require("config.settings").lsp.lua_ls_settings,
--      capabilities = cmp_nvim_lsp.default_capabilities()
--    }
--    ---- to delete END -----
  end
}
