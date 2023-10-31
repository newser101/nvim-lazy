return {

  "neovim/nvim-lspconfig",
  -- lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    -- { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
    -- from Lazyvim
    { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
    { "folke/neodev.nvim",  opts = {} },
    -- "hrsh7th/cmp-nvim-lsp",
  },
  -- enabled = true,

  config = function()
    -- TODO: maybe rethink of better/handy/logic keymaps lhs definition
    -- global keymaps
    vim.keymap.set("n", "gl", vim.diagnostic.open_float)
    vim.keymap.set("n", "<leader>lk", vim.diagnostic.goto_prev)
    vim.keymap.set("n", "<leader>lj", vim.diagnostic.goto_next)
    vim.keymap.set("n", "<leader>ll", vim.diagnostic.setloclist)

    -- TODO: capabilities supported by nvim-cmp
    -- TODO: add local keymaps
    -- TODO: https://github.com/neovim/nvim-lspconfig/wiki/Language-specific-plugins

    local lspconfig = require("lspconfig")
    -- list of language servers
    local servers = require("lsp.lspserver")



    -- lspconfig.pyright.setup {}  -- connest to server
    require("lspconfig").pyright.setup({
      on_attach = function()
        print("pyright attached")
        vim.keymap.set("n", "K", vim.lsp.buf.hover(), { buffer = 0 })
      end,
    }) -- connect to server
    require("lspconfig").lua_ls.setup({
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = "LuaJIT",
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { "vim" },
          },
          workspace = { -- NOTE: need for 'luv' bug
            checkThirdParty = false,
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
          },
          completion = {
            callSnippet = "Replace",
          },
          telemetry = {
            enable = false,
          },
        },
      },

      on_attach = function()
        print("lua attached")
        vim.keymap.set("n", "K", vim.lsp.buf.hover(), { buffer = 0 })
      end,
    }) -- connect to server
  end,
}
