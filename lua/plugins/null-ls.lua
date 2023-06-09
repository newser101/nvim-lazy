return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  version = "*",
  enabled = true,

  config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local code_actions = null_ls.builtins.code_actions
    --		local completion = null_ls.builtins.completion
    --		local hover = null_ls.builtins.hover

    null_ls.setup({
      -- NOTE: check if needed (maybe diagnostics)
      debug = false,
      --      log_level = "off",  -- if off :NULLINFO didnt work
      sources = {
        -- lua --
        formatting.stylua, -- lua
        diagnostics.luacheck.with({
          extra_args = { "--allow_defined" },
        }),
        -- python --
        formatting.black, -- python
        diagnostics.flake8,
        -- shell --
        formatting.beautysh,
        diagnostics.shellcheck,
        code_actions.shellcheck,
        -- --
        formatting.prettier, -- CSS, Flow, HTML, JSON, JSX, JavaScript, LESS, Markdown, SCSS, TypeScript, Vue, YAML
      },
    })
  end,
}
