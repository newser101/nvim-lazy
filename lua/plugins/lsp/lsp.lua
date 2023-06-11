-- https://github.com/Alexis12119/nvim-config/tree/main/lua/plugins/lsp
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/lsp/init.lua
--
-- https://github.com/loctvl842/nvim/blob/master/lua/tvl/core/resources/lsp.lua

return {
  -- lspconfig
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" }, -- note check
  cmd = { "LspInfo", "LspInstall", "LspUninstall" },
  --  lazy=true,  -- NOTE: check
  dependencies = {
    --      { "folke/neoconf.nvim", cmd = "Neoconf", config = true }, -- NOTE: produce an error in healthcheck
    -- IMPORTANT: make sure to setup neodev BEFORE lspconfig
    { "folke/neodev.nvim", opts = {} },
    "hrsh7th/cmp-nvim-lsp",

  },
  keys = {
    --  TODO: edit keymaps for my uses
    { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>",           desc = "Code Action" },
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
  config = function()
--    require("plugins.lsp.handlers").setup()
    require("plugins.lsp.util").on_attach(function(client,buffer)
      require("plugins.lsp.keymaps").attach(client,buffer)

    end)

  end,
}
