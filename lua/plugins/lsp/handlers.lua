local M = {}

local cmp_nvim_lsp = require "cmp_nvim_lsp"

M.capabilities = cmp_nvim_lsp.default_capabilities() -- NOTE: check

M.setup = function()
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
      suffix = "",
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
          checkThirdParty = false, -- dissable conf env as 'luv'
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
  } -- TODO: remove after config mason   END
end
----- keymaps -------
local function lsp_keymaps(bufnr)
  local keymap = vim.keymap.set
  local opts = { buffer = bufnr, }
  --Remap space as leader key
  keymap("", "<Space>", "<Nop>", opts)
  vim.g.mapleader = " "
  -- NOTE maybie glepnir/lspsaga.nvim
  --  keymap("n", "gD", ":Lspsaga lsp_finder<CR>", opts)
  keymap('n', 'gD', vim.lsp.buf.declaration, opts)
  keymap('n', 'gd', vim.lsp.buf.definition, opts)
  keymap('n', 'K', vim.lsp.buf.hover, opts)
  keymap('n', 'gi', vim.lsp.buf.implementation, opts)
  keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  --  keymap('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  --  keymap('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
  --  keymap('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
  --  keymap('n', '<space>wl', function()
  --    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  --  end, opts)
keymap('n', '<space>D', vim.lsp.buf.type_definition, opts)
  keymap('n', '<space>rn', vim.lsp.buf.rename, opts)
  keymap(bufnr,{ 'n', 'v' }, '<space>ca', "<cmd>lua vim.lsp.buf.code_action()<CR>", {noremap=true,silent=true})
  keymap('n', 'gr', vim.lsp.buf.references, opts)
  keymap('n', '<space>f', function()
    vim.lsp.buf.format { async = true }
  end, opts)
end

-- on_attach function
M.on_attach = function(bufnr)
  lsp_keymaps(bufnr) -- TODO keymap
  -- TODO highlight
end

return M
