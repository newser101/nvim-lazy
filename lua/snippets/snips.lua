print("snippet")
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("lua", {
  s("hhh", t("hello world from snippets")),
})
