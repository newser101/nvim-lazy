return {
  "williamboman/mason.nvim", -- NOTE: check documentation
  build = ":MasonUpdate",
  cmd = "Mason",
  event = "BufReadPre",
  dependencies = {
    "williamboman/mason-lspconfig.nvim", -- NOTE: check documentation
    lazy = true,
  },
  config = function()
    local installed = require("config.handler").mason_lspconfig_ens_installed
    local settings = {
      ui = {
        border = "none",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
      log_level = vim.log.levels.INFO,
      max_concurrent_installers = 4,
    }

    require("mason").setup(settings)
    require("mason-lspconfig").setup {
      ensure_installed = installed,
      automatic_installation = true,
    }
  end

}
