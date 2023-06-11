local M = {}

local keymap = vim.keymap.set
local cmp_nvim_lsp = require "cmp_nvim_lsp"

M.capabilities = cmp_nvim_lsp.default_capabilities() -- NOTE: check

M.setup = function()
  print('M.setup')
  local signs = { Error = "", Warn = "", Hint = "", Info = "" }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  local config = {
    -- Enable virtual text
    virtual_text = true,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }
  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })

  local lspconfig = require('lspconfig') -- TODO: remove after config mason
  lspconfig.pyright.setup {}
  lspconfig.lua_ls.setup {
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { 'vim' },
        },
        workspace = {
          checkThirdParty = false,     -- dissable conf env as 'luv'
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
  }   -- TODO: remove after config mason   END
end
----- keymaps -------
local function lsp_keymaps(bufnr)
  local opts = { buffer = bufnr, silent = true }
  -- NOTE maybie glepnir/lspsaga.nvim
  keymap('n', 'gD', vim.lsp.buf.declaration, opts)
end

-- on_attach function
M.on_attach = function(bufnr)
  lsp_keymaps(bufnr)  -- TODO keymap
  -- TODO highlight
end

return M
