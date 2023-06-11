local servers={

  pyright= {
    settings={
        python = {
        analysis = {
          indexing = true,
          typeCheckingMode = "basic",
          diagnosticMode = "openFilesOnly",
          autoImportCompletions = false,
          -- autoSearchPaths = false,
          inlayHints = {
            variableTypes = true,
            functionReturnTypes = true,
          },
          useLibraryCodeForTypes = true,
          diagnosticSeverityOverrides = {
            reportGeneralTypeIssues = "none",
            reportOptionalMemberAccess = "none",
            reportOptionalSubscript = "none",
            reportPrivateImportUsage = "none",
          },
        },
      },
    },
  },

  lua_ls= {
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
        workspace = {
          checkThirdParty = false, -- dissable conf env as 'luv'
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
  },
} 

return servers
