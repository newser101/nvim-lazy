return {
"hrsh7th/nvim-cmp",
--  version = "*", -- last release is way too old
 -- event = "InsertEnter",
  dependencies = {
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lua",
    "saadparwaiz1/cmp_luasnip",
    -- For luasnip users.
    {"L3MON4D3/LuaSnip",
    dependencies={
      "rafamadriz/friendly-snippets",
    },
  },
  },
-- NOTE: check best event={}
event={
  "InsertEnter",
  "CmdlineEnter",
},
-- TODO: replace with zbirenbaum/copilot.lua

config = function()
---- config ------
local cmp = require("cmp")
local luasnip = require("luasnip")
require("luasnip.loaders.from_snipmate").lazy_load{path = vim.fn.stdpath "config" .. "/snippets/snipmate"} -- new
require("luasnip.loaders.from_vscode").lazy_load()
local icons= require("config.icons")  -- load icons from config/icons 

---- function for mapping
local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end
-------------------------

---- setup cmp ------
cmp.setup({
  --- recommended setup from https://github.com/hrsh7th/nvim-cmp
  snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    ----- mapping 
    mapping = cmp.mapping.preset.insert {
--       behavior=cmp.ConfirmBehavior.Replace,
--      ["<C-k>"] = cmp.mapping.select_prev_item(),
      ["C-k"] = cmp.mapping.select_prev_item({behavior=cmp.SelectBehavior.Insert}),
--      ["<C-j>"] = cmp.mapping.select_next_item({behavior=cmp.n.insert}),
      ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
      ["<C-Space>"] = cmp.mapping.complete(cmp.mapping.complete(),{ "i", "c" }),
      ["<C-e>"] = cmp.mapping {
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      },
      -- Super Tab
      -- Accept currently selected item. If none selected, `select` first item.
      -- Set `select` to `false` to only confirm explicitly selected items.
      ["<CR>"] = cmp.mapping.confirm { select = true },
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expandable() then
          luasnip.expand()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif check_backspace() then
          fallback()
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
    },

    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        local kind_icons=icons.kind_cmp -- load icons from config/icons
        vim_item.kind = kind_icons[vim_item.kind]
        vim_item.menu = ({
          nvim_lsp = "LSP",
          nvim_lua = "NVIM_LUA",
          luasnip = "Snippet",
          buffer = "Buffer",
          path = "Path",
--          emoji = "",
        })[entry.source.name]
        return vim_item
      end,
    },
    sources = {
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "path" },
    },
    confirm_opts = {
      behavior=cmp.ConfirmBehavior.Replace,
      select=false,
    },
    window={
      compltion=cmp.config.window.bordered(),
      documention=cmp.config.window.bordered(),
          },
    experimental={
      ghost_text=false,
      native_menu=false,
    },
})
end,
}
