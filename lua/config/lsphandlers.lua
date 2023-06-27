local M= {}

---- mason -----
M.mason_ensure_installed={
mason_lspconfig_ens_installed={
  "lua_ls",
  "pyright"
}
}
---- newlsp -------
M.newlsp_lua_ls_settings={
        settings = {
        Lua = {
          runtime={
            version="LuaJIT",
          },
          diagnostics={
            globals={'vim'},
          },
            checkThirdParty = false,
            workspace = { -- NOTE: need for 'luv' bug
            library=vim.api.nvim_get_runtime_file("",true),
          completion = {
          },
            callSnippet = "Replace",
          },
          telemetry = {
            enable = false
          },
        }
      }
}

return M
