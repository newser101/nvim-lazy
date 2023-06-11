local M = {}

--M.attach = function(client, buffer)
M.attach = function( buffer)
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
