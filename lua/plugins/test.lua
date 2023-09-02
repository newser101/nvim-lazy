local opts
local desc
opts = { noremaps = true, silent = true }

local function tabext(table, desc_text)
  table.desc = desc_text
end

tabext(opts, "help")

for k, i in pairs(opts) do
  print(k, i)
end
