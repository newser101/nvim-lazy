-- eventually use navic for statusline
-- https://alpha2phi.medium.com/neovim-for-beginners-status-line-dd0c97fba978
-- https://github.com/SmiteshP/nvim-navic

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  requires = {
    "nvim-web-devicons",
  },
  enabled = true,

  --------------- lualine config ---------------------------
  config = function()
    --- link to icons --
    local icons = require("config.icons").lualine

    local diagnostics = {
      "diagnostics",
      -- Table of diagnostic sources, available sources are:
      --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
      sources = { "nvim_diagnostic" },
      sections = { "error", "warn", "info", "hint" },
      symbols = icons.diagnostic_symbols,
      diagnostics_color = {
        -- Same values as the general color option can be used here.
        error = "DiagnosticError", -- Changes diagnostics' error color.
        warn = "DiagnosticWarn", -- Changes diagnostics' warn color.
        info = "DiagnosticInfo", -- Changes diagnostics' info color.
        hint = "DiagnosticHint", -- Changes diagnostics' hint color.
      },
      colored = true,
      update_in_insert = false,
      always_visible = false,
    }

    local hide_in_width = function()
      return vim.fn.winwidth(0) > 80
    end

    local diff = {
      "diff",
      colored = true,
      symbols = icons.diff,
      cond = hide_in_width,
      diff_color = {
        -- Same color values as the general color option can be used here.
        added = "DiffAdd",   -- Changes the diff's added color
        -- added    = 'LuaLineDiffAdd',    -- Changes the diff's added color
        modified = "DiffChange", -- Changes the diff's modified color
        -- modified = "LuaLineDiffChange", -- Changes the diff's modified color
        removed = "DiffDelete", -- Changes the diff's removed color you
        -- removed = "LuaLineDiffDelete", -- Changes the diff's removed color you
      },
    }

    -- local spaces = function()
    --   return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
    -- end

    -- local filetype = {
    --   "filetype",
    --   colored = true,
    --   icon_only = false,
    -- }

    -- local location = {
    --   "location",
    --   padding = 0,
    -- }

    -- local buffers = {
    --   "buffers",
    --   mode = 2,
    --   max_length = vim.o.columns * 2 / 3,
    --   filetype_names = {
    --     TelescopePrompt = "Telescope",
    --     dashboard = "Dashboard",
    --     packer = "Packer",
    --     fzf = "FZF",
    --     alpha = "Alpha",
    --   },
    -- }

    -- local progress = {
    --   "progress",
    --   color = {
    --     fg = "#bbc2cf",
    --     gui = "bold",
    --   },
    -- }

    local mode = {
      "mode",
      icons_enabled = false,
    }

    -- Lsp = function()
    --   local msg = "No Active Lsp"
    --   local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    --   local clients = vim.lsp.get_active_clients()
    --   if next(clients) == nil then
    --     return msg
    --   end
    --   for _, client in ipairs(clients) do
    --     local filetypes = client.config.filetypes
    --     if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
    --       return client.name
    --     end
    --   end
    --   return msg
    -- end

    ----------- setup lualine ---------------------
    require("lualine").setup({
      options = {
        theme = "auto",
        -- theme = "solarized_light",
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        disabled_filetypes = { "alpha", "dashboard" },
        -- always_divide_middle = true,
      },

      sections = {
        lualine_a = { mode },
        lualine_b = { "branch" },
        lualine_c = { diagnostics },

        lualine_x = { diff },
        lualine_y = { "filetype" },
        -- lualine_z = { "filename", "location" },
        lualine_z = { "filename", "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            "filename",
            file_status = true, -- displays file status (readonly status, modified status)
            path = 1,     -- 0 = just filename, 1 = relative path, 2 = absolute path
          },
        },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
    })
  end,
}
