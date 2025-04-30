local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local function filename_to_macro()
  local filename = vim.fn.expand("%:t:r") -- get file name without extension
  return "_" .. filename:upper() .. "_H_"
end

ls.add_snippets("all", {
  s("guard", {
    t("#ifndef "), f(filename_to_macro, {}),
    t({ "", "#define " }), f(filename_to_macro, {}),
    t({ "", "" }),
    t({ "", "" }),
    i(0), -- place for the user to write their code
      t({ "", "" }),
    t({ "", "#endif // " }), f(filename_to_macro, {}),
  }),
}, { key = 0 })

ls.add_snippets("all", {
  s("clangoff", {
    t("// clang-format off")
  }),
}, { key = 1 })

ls.add_snippets("all", {
  s("clangon", {
    t("// clang-format on")
  }),
}, { key = 2 })

ls.add_snippets("cpp", {
  s("getter", {
    i(1, "type"), t(" "), i(2, "var"), t({ "() const {", "" }),
    t("    return m_"), f(function(args) return args[1][1] end, { 2 }), t({ ";", "}" })
   }),
  s("setter", {
    t("void set"), f(function(args)
  local name = args[1][1]
  return name:sub(1, 1):upper() .. name:sub(2)
    end, { 2 }), t("("), i(1, "type"), t(" val) {"), t({ "", "    m_" }),
    i(2, "name"), t(" = val;"), t({ "", "}" })
  }),
}, { key = 3 })
