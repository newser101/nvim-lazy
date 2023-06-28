local settings = {
------ lsp settings BEGINN -------
lsp={
lua_ls_settings={
  print("config.lua_ls_settings"),
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
------ lsp settings END -------
}

return settings
