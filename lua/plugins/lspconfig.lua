-- https://blog.codeminer42.com/configuring-language-server-protocol-in-neovim/
return {
  "neovim/nvim-lspconfig",
  -- lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    -- { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
    -- from Lazyvim
    { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
    { "folke/neodev.nvim",  opts = {} },
    "hrsh7th/cmp-nvim-lsp",
  },
  -- enabled = true,
  --
  -- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization
  -- https://github.com/LunarVim/Launch.nvim/blob/master/lua/user/lspconfig.lua

  config = function()
    ---- global kemaps
    -- h: vim.diagnostic
    -- TODO: maybe rethink of better/handy/logic keymaps lhs definition
    vim.keymap.set("n", "gl", vim.diagnostic.open_float)
    vim.keymap.set("n", "<leader>lk", vim.diagnostic.goto_prev)
    vim.keymap.set("n", "<leader>lj", vim.diagnostic.goto_next)
    vim.keymap.set("n", "<leader>ll", vim.diagnostic.setloclist)

    --  capabilities supported by nvim-cmp
    --  show  handlers:
    --  :lua vim.print(vim.tbl_keys(vim.lsp.handlers))
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

    -- local Keymaps to parse to lsp setup
    local function lsp_keymaps(bufnr) -- to test
      -- local opts = { noremap = true, silent = true, buffer = bufnr, desc = "lsp" }
      local opts = { noremap = true, silent = true }
      -- set buffer local mapping
      local keymap = vim.api.nvim_buf_set_keymap
      -- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- orig
      keymap(bufnr,"n", "gD", vim.lsp.buf.declaration, opts)
      keymap(bufnr,"n", "gd", vim.lsp.buf.definition, opts)
      -- keymap(bufnr,"n", "K", vim.lsp.buf.hover, opts)
      keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
      keymap(bufnr,"n", "gi", vim.lsp.buf.implementation, opts)
      keymap(bufnr,"n", "<leader>ls", vim.lsp.buf.signature_help, opts)
      -- TODO: check if workspace is needed
      --      vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
      --      vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
      --      vim.keymap.set('n', '<space>wl', function()
      --        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      --      end, opts)
      vim.keymap.set("n", "<leader>ld", vim.lsp.buf.type_definition, opts)
      vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { noremap = true, buffer = bufnr }) -- no silent
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "<leader>lf", function()
        vim.lsp.buf.format({ async = true })
      end, opts)
    end

    local lspconfig = require("lspconfig")
    local servers = require("lsp.lspserver")
    local on_attach = function(client, bufnr)
      -- vim.print(client)
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

      local require_ok, conf_opts = pcall(require, "lsp." .. server)
      if require_ok then
        Opts = vim.tbl_deep_extend("force", conf_opts, Opts)
      end
      lspconfig[server].setup(Opts)
    end
  end,
}
