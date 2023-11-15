-- https://blog.codeminer42.com/configuring-language-server-protocol-in-neovim/
return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  -- enabled = true,
  --
  -- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization
  -- https://github.com/LunarVim/Launch.nvim/blob/master/lua/user/lspconfig.lua

  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local servers = require("lsp.lspserver")

    -- Global mappings
    vim.keymap.set("n","<leader>lf","<cmd>lua vim.lsp.buf.format()<CR>")

    -- local mappings
    local function lsp_keymaps(bufnr)
      local opts = { noremap = true, silent = true }
      local keymap = vim.api.nvim_buf_set_keymap
      -- :TODO check better keymap
      keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
      keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
      keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
      keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
      keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
      keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
      -- keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
      -- keymap(bufnr, "n", "<space>lf", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
    end

    local function on_attach(client, bufnr)
      lsp_keymaps(bufnr)
    end

    -- Change diagnostic symbols in the sign column (gutter)
    local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    local capabilities = cmp_nvim_lsp.default_capabilities()

    for _, server in pairs(servers) do
      local opts = {
        on_attach = on_attach,
        capabilities = capabilities,
      }

      local require_ok, conf_opts = pcall(require, "lsp." .. server)
      if require_ok then
        opts = vim.tbl_deep_extend("force", conf_opts, opts)
      end

      lspconfig[server].setup(opts)
    end
  end,
}
