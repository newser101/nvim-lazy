local M= {}

M.mason_ensure_installed={
mason_lspconfig_ens_installed={
  "lua_ls",
  "pyright"
}
}

M.newlsp_lua_ls_settings={
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
        }
      }
}

return M
