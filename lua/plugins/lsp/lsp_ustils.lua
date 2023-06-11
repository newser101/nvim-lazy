local M={}

M.on_attach = function(on_attach)
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local buffer = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      on_attach(client, buffer)
    end,
  })
end

M.capabilities = function(ext)
  return vim.tbl_deep_extend(
    "force",
    {},
    ext or {},
    require("cmp_nvim_lsp").default_capabilities(),
    { textDocument = { foldingRange = { dynamicRegistration = false, lineFoldingOnly = true } } }
  )
end


--M.attach = function(client, buffer)
M.lsp_keymaps function( buffer)
  local opts = { noremap = true, silent = true }
  local keymaps = vim.keymap.set
  keymaps(buffer, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  keymaps(buffer, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  keymaps(buffer, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  keymaps(buffer, "n", "[d", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
  keymaps(buffer, "n", "]d", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>", opts)
  keymaps(buffer, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
end


return M
