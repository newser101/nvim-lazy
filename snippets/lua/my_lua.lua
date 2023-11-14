local ls = require('luasnip')

local my_lua_snippet = ls.snippet({
    trig = "mylua",
    wordTrig = true,
    name = "My Lua Snippet",
    dscr = "Custom Lua snippet",
    expand = "print('This is my Lua snippet!')",
})

-- Define a basic snippet
local basic_snippet = ls.snippet({
    trig = "hello", -- Trigger word
    wordTrig = true, -- Trigger snippet only if the trigger word is a whole word
    name = "Hello Snippet", -- Snippet name
    dscr = "Simple Hello World snippet", -- Snippet description
    -- Snippet body
    expand = "function hello()\n\tprint('Hello, world!')\nend",
})

-- Add more snippets as needed

return {
    my_lua_snippet,
    basic_snippet,
    -- add more snippets as needed
}
