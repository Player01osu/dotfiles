-- colors/colorscheme.lua

local colors = {
-- content here will not be touched
-- PATCH_OPEN
Conceal = {fg = "cyan2", bg = "NONE"},
CursorLine = {bg = "Grey21"},
CursorLineNr = {fg = "Yellow", bg = "NONE"},
FoldColumn = {fg = "cyan2", bg = "NONE"},
Folded = {fg = "#F6F66A", bg = "NONE"},
Function = {},
Identifier = {},
LineNr = {fg = "grey36", bg = "NONE"},
MsgArea = {},
NormalFloat = {bg = "NONE"},
Operator = {fg = "NONE", bg = "NONE"},
Pmenu = {bg = "NONE"},
PreProc = {fg = "#FAFA66", bg = "NONE"},
QuickFixLine = {bg = "gray31"},
SignColumn = {},
Special = {},
Statement = {fg = "#F6F66A", bg = "NONE", bold = true},
Title = {fg = "Cyan", bg = "NONE"},
Todo = {fg = "Grey10", bg = "#F7F708"},
Type = {fg = "#62FD62", bg = "NONE", bold = true},
TSVariableBuiltin = {link = "Type"},
DiagnosticUnnecessary = {fg = "NONE", bg = "NONE"},
Visual = {bg = "Grey32"},
Whitespace = {fg = "Grey26"},
-- PATCH_CLOSE
-- content here will not be touched
}

-- colorschemes generally want to do this
vim.cmd("highlight clear")
vim.cmd("set t_Co=256")
vim.cmd("let g:colors_name='my_theme'")

-- apply highlight groups
for group, attrs in pairs(colors) do
  vim.api.nvim_set_hl(0, group, attrs)
end