return {
-- The line:
-- client.config.settings = vim.tbl_deep_extend('force', client.config.settings.Lua, {
-- should be
-- client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {

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
      workspace = { -- NOTE: need for 'luv' bug
        checkThirdParty = false,
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
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
