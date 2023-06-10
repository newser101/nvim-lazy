local M = {}


local function lsp_keymaps(bufnr)
   local opts = { noremap = true, silent = true }
   local keymap = vim.keymap.set
   keymap(bufnr, 'n', 'gd', vim.lsp.buf.definition, opts)
   keymap(bufnr, 'n', 'gi', vim.lsp.buf.implementation, opts)
end


M.on_attach=function (bufnr)
  lsp_keymaps(bufnr)
end


return M
