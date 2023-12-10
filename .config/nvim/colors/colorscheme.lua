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
-- highlight StatusLine guifg=#303030 guibg=#BBBBBB
StatusLine = {fg="#CFCFCF", bg="#151515", bold = false},
StatusLineNC = {link="StatusLine"},
TabLine = {link="StatusLine"},
-- PATCH_CLOSE
-- content here will not be touched
}
--hi StatusLineNC guifg=NONE      guibg=NONE     guisp=NONE gui=reverse      ctermfg=NONE      ctermbg=NONE     cterm=reverse

-- colorschemes generally want to do this
vim.cmd("highlight clear")

-- TODO: Make this less hacky LMAO
vim.cmd([[
" General
hi Conceal      guifg=LightGrey guibg=DarkGrey guisp=NONE gui=NONE         ctermfg=LightGrey ctermbg=DarkGrey cterm=NONE
hi Cursor       guifg=bg        guibg=fg       guisp=NONE gui=NONE         ctermfg=bg        ctermbg=fg       cterm=NONE
hi lCursor      guifg=bg        guibg=fg       guisp=NONE gui=NONE         ctermfg=bg        ctermbg=fg       cterm=NONE
hi DiffText     guifg=NONE      guibg=Red      guisp=NONE gui=bold         ctermfg=NONE      ctermbg=Red      cterm=bold
hi ErrorMsg     guifg=White     guibg=Red      guisp=NONE gui=NONE         ctermfg=White     ctermbg=DarkRed  cterm=NONE
hi IncSearch    guifg=NONE      guibg=NONE     guisp=NONE gui=reverse      ctermfg=NONE      ctermbg=NONE     cterm=reverse
hi ModeMsg      guifg=NONE      guibg=NONE     guisp=NONE gui=bold         ctermfg=NONE      ctermbg=NONE     cterm=bold
hi NonText      guifg=Blue      guibg=NONE     guisp=NONE gui=bold         ctermfg=Blue      ctermbg=NONE     cterm=NONE
hi Normal       guifg=NONE      guibg=NONE     guisp=NONE gui=NONE         ctermfg=NONE      ctermbg=NONE     cterm=NONE
hi PmenuSbar    guifg=NONE      guibg=Grey     guisp=NONE gui=NONE         ctermfg=NONE      ctermbg=Grey     cterm=NONE
hi TabLineFill  guifg=NONE      guibg=NONE     guisp=NONE gui=reverse      ctermfg=NONE      ctermbg=NONE     cterm=reverse
hi TabLineSel   guifg=NONE      guibg=NONE     guisp=NONE gui=bold         ctermfg=NONE      ctermbg=NONE     cterm=bold
hi TermCursor   guifg=NONE      guibg=NONE     guisp=NONE gui=reverse      ctermfg=NONE      ctermbg=NONE     cterm=reverse
hi WinBar       guifg=NONE      guibg=NONE     guisp=NONE gui=bold         ctermfg=NONE      ctermbg=NONE     cterm=bold
hi WildMenu     guifg=Black     guibg=Yellow   guisp=NONE gui=NONE         ctermfg=Black     ctermbg=Yellow   cterm=NONE
hi! link VertSplit Normal
hi! link WinSeparator VertSplit
hi! link WinBarNC WinBar
hi! link EndOfBuffer NonText
hi! link LineNrAbove LineNr
hi! link LineNrBelow LineNr
hi! link QuickFixLine Search
hi! link CursorLineSign SignColumn
hi! link CursorLineFold FoldColumn
hi! link CurSearch Search
hi! link PmenuKind Pmenu
hi! link PmenuKindSel PmenuSel
hi! link PmenuExtra Pmenu
hi! link PmenuExtraSel PmenuSel
hi! link Substitute Search
hi! link Whitespace NonText
hi! link MsgSeparator StatusLine
hi! link NormalFloat Pmenu
hi! link FloatBorder WinSeparator
hi! link FloatTitle Title
hi! link FloatFooter Title
hi FloatShadow          guifg=NONE  guibg=Black  guisp=NONE gui=NONE    ctermfg=NONE  ctermbg=NONE   cterm=NONE blend=80
hi FloatShadowThrough   guifg=NONE  guibg=Black  guisp=NONE gui=NONE    ctermfg=NONE  ctermbg=NONE   cterm=NONE blend=100
hi RedrawDebugNormal    guifg=NONE  guibg=NONE   guisp=NONE gui=reverse ctermfg=NONE  ctermbg=NONE   cterm=reverse
hi RedrawDebugClear     guifg=NONE  guibg=Yellow guisp=NONE gui=NONE    ctermfg=NONE  ctermbg=Yellow cterm=NONE
hi RedrawDebugComposed  guifg=NONE  guibg=Green  guisp=NONE gui=NONE    ctermfg=NONE  ctermbg=Green  cterm=NONE
hi RedrawDebugRecompose guifg=NONE  guibg=Red    guisp=NONE gui=NONE    ctermfg=NONE  ctermbg=Red    cterm=NONE
hi Error                guifg=White guibg=Red    guisp=NONE gui=NONE    ctermfg=White ctermbg=Red    cterm=NONE term=reverse
hi Todo                 guifg=Blue  guibg=Yellow guisp=NONE gui=NONE    ctermfg=Black ctermbg=Yellow cterm=NONE term=standout
hi! link String Constant
hi! link Character Constant
hi! link Number Constant
hi! link Boolean Constant
hi! link Float Number
hi! link Function Identifier
hi! link Conditional Statement
hi! link Repeat Statement
hi! link Label Statement
hi! link Operator Statement
hi! link Keyword Statement
hi! link Exception Statement
hi! link Include PreProc
hi! link Define PreProc
hi! link Macro PreProc
hi! link PreCondit PreProc
hi! link StorageClass Type
hi! link Structure Type
hi! link Typedef Type
hi! link Tag Special
hi! link SpecialChar Special
hi! link Delimiter Special
hi! link SpecialComment Special
hi! link Debug Special
hi DiagnosticError          guifg=Red        guibg=NONE guisp=NONE       gui=NONE      ctermfg=1    ctermbg=NONE cterm=NONE
hi DiagnosticWarn           guifg=Orange     guibg=NONE guisp=NONE       gui=NONE      ctermfg=3    ctermbg=NONE cterm=NONE
hi DiagnosticInfo           guifg=LightBlue  guibg=NONE guisp=NONE       gui=NONE      ctermfg=4    ctermbg=NONE cterm=NONE
hi DiagnosticHint           guifg=LightGrey  guibg=NONE guisp=NONE       gui=NONE      ctermfg=7    ctermbg=NONE cterm=NONE
hi DiagnosticOk             guifg=LightGreen guibg=NONE guisp=NONE       gui=NONE      ctermfg=10   ctermbg=NONE cterm=NONE
hi DiagnosticUnderlineError guifg=NONE       guibg=NONE guisp=Red        gui=underline ctermfg=NONE ctermbg=NONE cterm=underline
hi DiagnosticUnderlineWarn  guifg=NONE       guibg=NONE guisp=Orange     gui=underline ctermfg=NONE ctermbg=NONE cterm=underline
hi DiagnosticUnderlineInfo  guifg=NONE       guibg=NONE guisp=LightBlue  gui=underline ctermfg=NONE ctermbg=NONE cterm=underline
hi DiagnosticUnderlineHint  guifg=NONE       guibg=NONE guisp=LightGrey  gui=underline ctermfg=NONE ctermbg=NONE cterm=underline
hi DiagnosticUnderlineOk    guifg=NONE       guibg=NONE guisp=LightGreen gui=underline ctermfg=NONE ctermbg=NONE cterm=underline
hi! link DiagnosticVirtualTextError DiagnosticError
hi! link DiagnosticVirtualTextWarn DiagnosticWarn
hi! link DiagnosticVirtualTextInfo DiagnosticInfo
hi! link DiagnosticVirtualTextHint DiagnosticHint
hi! link DiagnosticVirtualTextOk DiagnosticOk
hi! link DiagnosticFloatingError DiagnosticError
hi! link DiagnosticFloatingWarn DiagnosticWarn
hi! link DiagnosticFloatingInfo DiagnosticInfo
hi! link DiagnosticFloatingHint DiagnosticHint
hi! link DiagnosticFloatingOk DiagnosticOk
hi! link DiagnosticSignError DiagnosticError
hi! link DiagnosticSignWarn DiagnosticWarn
hi! link DiagnosticSignInfo DiagnosticInfo
hi! link DiagnosticSignHint DiagnosticHint
hi! link DiagnosticSignOk DiagnosticOk
hi DiagnosticDeprecated guifg=NONE guibg=NONE guisp=Red gui=strikethrough ctermfg=NONE ctermbg=NONE cterm=strikethrough
hi! link DiagnosticUnnecessary Comment
hi! link LspInlayHint NonText
hi! link SnippetTabstop Visual

" Text
hi! link @text.literal Comment
hi! link @text.reference Identifier
hi! link @text.title Title
hi! link @text.uri Underlined
hi! link @text.underline Underlined
hi! link @text.todo Todo

" Miscs
hi! link @comment Comment
hi! link @punctuation Delimiter

" Constants
hi! link @constant Constant
hi! link @constant.builtin Special
hi! link @constant.macro Define
hi! link @define Define
hi! link @macro Macro
hi! link @string String
hi! link @string.escape SpecialChar
hi! link @string.special SpecialChar
hi! link @character Character
hi! link @character.special SpecialChar
hi! link @number Number
hi! link @boolean Boolean
hi! link @float Float

" Functions
hi! link @function Function
hi! link @function.builtin Special
hi! link @function.macro Macro
hi! link @parameter Identifier
hi! link @method Function
hi! link @field Identifier
hi! link @property Identifier
hi! link @constructor Special

" Keywords
hi! link @conditional Conditional
hi! link @repeat Repeat
hi! link @label Label
hi! link @operator Operator
hi! link @keyword Keyword
hi! link @exception Exception

hi! link @variable Identifier
hi! link @type Type
hi! link @type.definition Typedef
hi! link @storageclass StorageClass
hi! link @namespace Identifier
hi! link @include Include
hi! link @preproc PreProc
hi! link @debug Debug
hi! link @tag Tag

" LSP semantic tokens
hi! link @lsp.type.class Structure
hi! link @lsp.type.comment Comment
hi! link @lsp.type.decorator Function
hi! link @lsp.type.enum Structure
hi! link @lsp.type.enumMember Constant
hi! link @lsp.type.function Function
hi! link @lsp.type.interface Structure
hi! link @lsp.type.macro Macro
hi! link @lsp.type.method Function
hi! link @lsp.type.namespace Structure
hi! link @lsp.type.parameter Identifier
hi! link @lsp.type.property Identifier
hi! link @lsp.type.struct Structure
hi! link @lsp.type.type Type
hi! link @lsp.type.typeParameter TypeDef
hi! link @lsp.type.variable Identifier

hi ColorColumn  guifg=NONE     guibg=DarkRed     guisp=NONE    gui=NONE      ctermfg=NONE         ctermbg=DarkRed     cterm=NONE
hi CursorColumn guifg=NONE     guibg=Grey40      guisp=NONE    gui=NONE      ctermfg=NONE         ctermbg=DarkGrey    cterm=NONE
hi CursorLine   guifg=NONE     guibg=Grey40      guisp=NONE    gui=NONE      ctermfg=NONE         ctermbg=NONE        cterm=underline
hi CursorLineNr guifg=Yellow   guibg=NONE        guisp=NONE    gui=bold      ctermfg=Yellow       ctermbg=NONE        cterm=underline
hi DiffAdd      guifg=NONE     guibg=DarkBlue    guisp=NONE    gui=NONE      ctermfg=NONE         ctermbg=DarkBlue    cterm=NONE
hi DiffChange   guifg=NONE     guibg=DarkMagenta guisp=NONE    gui=NONE      ctermfg=NONE         ctermbg=DarkMagenta cterm=NONE
hi DiffDelete   guifg=Blue     guibg=DarkCyan    guisp=NONE    gui=bold      ctermfg=Blue         ctermbg=DarkCyan    cterm=NONE
hi Directory    guifg=Cyan     guibg=NONE        guisp=NONE    gui=NONE      ctermfg=LightCyan    ctermbg=NONE        cterm=NONE
hi FoldColumn   guifg=Cyan     guibg=Grey        guisp=NONE    gui=NONE      ctermfg=Cyan         ctermbg=DarkGrey    cterm=NONE
hi Folded       guifg=Cyan     guibg=DarkGrey    guisp=NONE    gui=NONE      ctermfg=Cyan         ctermbg=DarkGrey    cterm=NONE
hi LineNr       guifg=Yellow   guibg=NONE        guisp=NONE    gui=NONE      ctermfg=Yellow       ctermbg=NONE        cterm=NONE
hi MatchParen   guifg=NONE     guibg=DarkCyan    guisp=NONE    gui=NONE      ctermfg=NONE         ctermbg=DarkCyan    cterm=NONE
hi MoreMsg      guifg=SeaGreen guibg=NONE        guisp=NONE    gui=bold      ctermfg=LightGreen   ctermbg=NONE        cterm=NONE
hi Pmenu        guifg=NONE     guibg=Magenta     guisp=NONE    gui=NONE      ctermfg=Black        ctermbg=Magenta     cterm=NONE
hi PmenuSel     guifg=NONE     guibg=DarkGrey    guisp=NONE    gui=NONE      ctermfg=DarkGrey     ctermbg=Black       cterm=NONE      blend=NONE
hi PmenuThumb   guifg=NONE     guibg=White       guisp=NONE    gui=NONE      ctermfg=NONE         ctermbg=White       cterm=NONE
hi Question     guifg=Green    guibg=NONE        guisp=NONE    gui=bold      ctermfg=LightGreen   ctermbg=NONE        cterm=NONE
hi Search       guifg=Black    guibg=Yellow      guisp=NONE    gui=NONE      ctermfg=Black        ctermbg=Yellow      cterm=NONE
hi SignColumn   guifg=Cyan     guibg=Grey        guisp=NONE    gui=NONE      ctermfg=Cyan         ctermbg=DarkGrey    cterm=NONE
hi SpecialKey   guifg=Cyan     guibg=NONE        guisp=NONE    gui=NONE      ctermfg=LightBlue    ctermbg=NONE        cterm=NONE
hi SpellBad     guifg=NONE     guibg=NONE        guisp=Red     gui=undercurl ctermfg=NONE         ctermbg=Red         cterm=NONE
hi SpellCap     guifg=NONE     guibg=NONE        guisp=Blue    gui=undercurl ctermfg=NONE         ctermbg=Blue        cterm=NONE
hi SpellLocal   guifg=NONE     guibg=NONE        guisp=Cyan    gui=undercurl ctermfg=NONE         ctermbg=Cyan        cterm=NONE
hi SpellRare    guifg=NONE     guibg=NONE        guisp=Magenta gui=undercurl ctermfg=NONE         ctermbg=Magenta     cterm=NONE
hi TabLine      guifg=NONE     guibg=DarkGrey    guisp=NONE    gui=underline ctermfg=white        ctermbg=DarkGrey    cterm=underline
hi Title        guifg=Magenta  guibg=NONE        guisp=NONE    gui=bold      ctermfg=LightMagenta ctermbg=NONE        cterm=NONE
hi Visual       guifg=NONE     guibg=DarkGrey    guisp=NONE    gui=NONE      ctermfg=NONE         ctermbg=NONE        cterm=NONE
hi WarningMsg   guifg=Red      guibg=NONE        guisp=NONE    gui=NONE      ctermfg=LightRed     ctermbg=NONE        cterm=NONE
hi Comment      guifg=#80a0ff  guibg=NONE        guisp=NONE    gui=NONE      ctermfg=Cyan         ctermbg=NONE        cterm=NONE      term=bold
hi Constant     guifg=#ffa0a0  guibg=NONE        guisp=NONE    gui=NONE      ctermfg=Magenta      ctermbg=NONE        cterm=NONE      term=underline
hi Special      guifg=Orange   guibg=NONE        guisp=NONE    gui=NONE      ctermfg=LightRed     ctermbg=NONE        cterm=NONE      term=bold
hi Identifier   guifg=#40ffff  guibg=NONE        guisp=NONE    gui=NONE      ctermfg=Cyan         ctermbg=NONE        cterm=bold      term=underline
hi Statement    guifg=#ffff60  guibg=NONE        guisp=NONE    gui=bold      ctermfg=Yellow       ctermbg=NONE        cterm=NONE      term=bold
hi PreProc      guifg=#ff80ff  guibg=NONE        guisp=NONE    gui=NONE      ctermfg=LightBlue    ctermbg=NONE        cterm=NONE      term=underline
hi Type         guifg=#60ff60  guibg=NONE        guisp=NONE    gui=bold      ctermfg=LightGreen   ctermbg=NONE        cterm=NONE      term=underline
hi Underlined   guifg=#80a0ff  guibg=NONE        guisp=NONE    gui=underline ctermfg=LightBlue    ctermbg=NONE        cterm=underline term=underline
hi Ignore       guifg=bg       guibg=NONE        guisp=NONE    gui=NONE      ctermfg=black        ctermbg=NONE        cterm=NONE      term=NONE
]])

vim.cmd("set t_Co=256")
vim.cmd("let g:colors_name='my_theme'")

-- apply highlight groups
for group, attrs in pairs(colors) do
  vim.api.nvim_set_hl(0, group, attrs)
end
