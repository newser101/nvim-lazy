return {
  settings = {
          Lua = {
            workspace = {   -- NOTE: need for 'luv' bug
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
          pyright = {
          },
          print("lua settings from settings")
        }
