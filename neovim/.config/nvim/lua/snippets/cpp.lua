local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local function filename_to_macro()
  local filename = vim.fn.expand("%:t:r") -- get file name without extension
  return "_" .. filename:upper() .. "_H_"
end

print("kek")

ls.add_snippets("all", {
  s("guard", {
    t("#ifndef "), f(filename_to_macro, {}),
    t({ "", "#define " }), f(filename_to_macro, {}),
    t({ "", "" }),
    i(0), -- place for the user to write their code
    t({ "", "#endif // " }), f(filename_to_macro, {}),
  }),
})
