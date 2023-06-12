return {
  -- lspconfig
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  cmd = { "LspInfo", "LspInstall", "LspUninstall" },
  lazy = true, -- NOTE: check
  dependencies = {
    --{ "folke/neoconf.nvim", cmd = "Neoconf", config = true }, -- NOTE: produce an error in healthcheck
    { "folke/neodev.nvim",
      --    "williamboman/nvim-lsp-installer",
      --     "williamboman/mason.nvim",
      --     "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp", -- in cmp.lua
    },
  },
  -- TODO: clean up code
  keys = {
    --  TODO: edit keymaps for my uses
    { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>",           desc = "Code Action" },
    { "gd",         "<cmd>lua vim.lsp.buf.definition()<CR>",            desc = "Goto Definition" },
    { "<leader>ld", "<cmd>Telescope lsp_document_diagnostics<cr>",      desc = "Document Diagnostics" },
    { "<leader>lw", "<cmd>Telescope lsp_workspace_diagnostics<cr>",     desc = "Workspace Diagnostics" },
    { "<leader>li", "<cmd>LspInfo<cr>",                                 desc = "Info" },
    { "<leader>lI", "<cmd>LspInstallInfo<cr>",                          desc = "Installer Info" },
    { "<leader>lj", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",      desc = "Next Diagnostic" },
    { "<leader>lk", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",      desc = "Prev Diagnostic" },
    { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>",              desc = "CodeLens Action" },
    { "<leader>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>",    desc = "Quickfix" },
    { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>",                desc = "Rename" },
    { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>",          desc = "Document Symbols" },
    { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },
  },

  -----------config------------
  config = function()
    local cmp_nvim_lsp = require "cmp_nvim_lsp"


    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
    local lspconfig = require('lspconfig')

    --    local on_attach = function (client,bufnr)
    --       if client.name == "lua_ls" then
    --      client.server_capabilities.documentFormattingProvider = false
    --    end
    --      lsp_keymaps(bufnr)
    --      require("lua.plugins.illuminate").on_attach(client)
    --
    --    end
    -------- setup servers BEGINN ---------------
    lspconfig.pyright.setup {} -- TODO: buil serverlist in config
    --
    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          workspace = { -- NOTE: need for 'luv' bug
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
    -------- setup servers END ---------------

    local signs = {
      { name = "DiagnosticSignError", text = "" },
      { name = "DiagnosticSignWarn",  text = "" },
      { name = "DiagnosticSignHint",  text = "" },
      { name = "DiagnosticSignInfo",  text = "" },
    }

    for _, sign in ipairs(signs) do
      vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end


    local config = {
      -- disable virtual text
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
  end,
}
