local lush = require('lush')
local hsl = lush.hsl

-- Call lush with our lush-spec.
-- ignore the "theme" variable for now
---@diagnostic disable: undefined-global
local theme = lush(function()
  return {
    -- It's recommended to disable wrapping with `setlocal nowrap`, each
    -- group in this tutorial is appended by it's description for ease of use,
    -- but the wrapping may be distracting.
    --
    -- You may also receive (mostly ignorable) linter/lsp warnings,
    -- because our lua is a bit more dynamic than they expect.
    -- You may also wish to disable those while editing your theme
    -- they produce a lot of visual noise.

    -- lush-spec statements are in the form:
    --
    --   <HighlightGroupName> { bg = <hsl>|<string>,
    --                          fg = <hsl>|<string>,
    --                          sp = <hsl>|<string>,
    --                          gui = <string> },
    --
    -- Any vim highlight group name is valid, and any unrecognized key is
    -- omitted.
    --
    -- Lets define our "Normal" highlight group, using our sea colours.

    -- Set a highlight group from hsl variables
    -- Uncomment "Normal"
    -- Normal { bg = sea_deep, fg = sea_foam }, -- normal text

    -- You should be on the water now, Lush.ify has automatically
    -- recognized our Highlight definition and applied it in real time.
    -- Note: This is applied *vim wide* so other buffers reflect your changes
    --       too. Try opening up a project in a split to see your new theme in
    --       a real setting.

    -- Lush is most useful when you use previously defined groups aid in
    -- picking colours for future groups.
    --
    -- For example, lets set our cursorline (if enabled: `setlocal cursorline`)
    -- to be slightly lighter than our normal background.
    --
    -- Set a highlight group from another highlight group
    CursorLine { bg = "Grey20" }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.

    -- Or maybe lets style our visual selection to match Cusorlines background,
    -- and render text in Normal's foreground complement.
    -- Visual { bg = CursorLine.bg, fg = Normal.fg.rotate(180) },

    -- We can also link a group to another group. These will inherit all
    -- of the linked group options (See h: hi-link).
    -- (`setlocal cursorcolumn`)
    -- (May have performance impact depending on terminal)
    -- CursorColumn { CursorLine }, -- Screen-column at the cursor, when 'cursorcolumn' is set.

    -- We can make white space characters slighly visible
    Whitespace { fg = "Grey26" },

    -- We can inherit properties if we want to tweak a group slightly
    -- Note: This looks similar to a link, but the defined group will have its
    -- own properties, cloned from the parent.
    -- Lets make Comments look like Whitespace, but with italics
    -- Comment { Whitespace, gui="italic" },

    -- Here's how we might set our line numbers to be relational to Normal,
    -- note we'er also using some shorter aliases here.
    -- (`setlocal number`)
    LineNr       { bg = "NONE", fg = "grey36" }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr { bg = "NONE", fg = "Yellow" }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.

    -- You can also use highlight groups to define "base" colors, if you dont
    -- want to use regular lua variables. They will behave in the same way.
    -- Note that these groups *will* be defined as a vim-highlight-group, so
    -- try not to pick names that might end up being used by something.
    --
    -- CamelCase is by tradition but you don't have to use it.
    -- search_base  { bg = hsl(52, 52, 52), fg = hsl(52, 10, 10) },
    -- Search       { search_base },
    -- IncSearch    { bg = search_base.bg.rotate(-20), fg = search_base.fg.darken(90) },

    -- We can also mix colours together
    -- Type         { fg = Normal.fg.mix(LineNr.fg, 30) }

    -- And that's the basics of using Lush!
    --
    -- If you want to know more about exporting themes for use without lush
    -- (for distribution) or integration with other plugins (such as
    -- lightline), see the bottom of this file `/export-external`, the README,
    -- or the examples folder.

    -- For experimentation, below is all the Neovim default highlight groups
    -- from docs as of 0.5.0-812.
    --
    -- If you wish to create a theme, it's recommended you copy the template
    -- folder from the examples folder.
    --
    -- Referenced/linked groups must come before being referenced/linked,
    -- (i.e. above we create Normal before trying to set CursorLine)
    -- so the order shown ((mostly) alphabetical) is likely
    -- not the order you will end up with.
    --
    -- You can uncomment these and leave them empty to disable any
    -- styling for that group (meaning they mostly get styled as Normal)
    -- or leave them commented to apply vims default colouring or linking.

    NormalFloat  { bg = "NONE" }, -- Normal text in floating windows.
    -- ColorColumn  { }, -- used for the columns set with 'colorcolumn'
	Conceal      { bg = "NONE", fg = "cyan2" }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    -- Cursor       { }, -- character under the cursor
    -- lCursor      { }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM     { }, -- like Cursor, but used when in IME mode |CursorIM|
    -- Directory    { }, -- directory names (and other special names in listings)
    -- DiffAdd      { }, -- diff mode: Added line |diff.txt|
    -- DiffChange   { }, -- diff mode: Changed line |diff.txt|
    -- DiffDelete   { }, -- diff mode: Deleted line |diff.txt|
    -- DiffText     { }, -- diff mode: Changed text within a changed line |diff.txt|
    -- EndOfBuffer  { }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    -- TermCursor   { }, -- cursor in a focused terminal
    -- TermCursorNC { }, -- cursor in an unfocused terminal
    -- ErrorMsg     { }, -- error messages on the command line
    -- VertSplit    { }, -- the column separating vertically split windows
    Folded       { bg = "NONE", fg = hsl("#ffff60").de(11) }, -- line used for closed folds
    FoldColumn   {  bg = "NONE", fg = "cyan2" }, -- 'foldcolumn'
    SignColumn   { }, -- column where |signs| are displayed
    -- Substitute   { }, -- |:substitute| replacement text highlighting
    -- MatchParen   { }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    -- ModeMsg      { }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea      { }, -- Area for messages and cmdline
    -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    -- MoreMsg      { }, -- |more-prompt|
    -- NonText      { }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    -- NormalNC     { }, -- normal text in non-current windows
    Pmenu        { bg = "NONE" }, -- Popup menu: normal item.
    -- PmenuSel     { }, -- Popup menu: selected item.
    -- PmenuSbar    { }, -- Popup menu: scrollbar.
    -- PmenuThumb   { }, -- Popup menu: Thumb of the scrollbar.
    -- Question     { }, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    -- SpecialKey   { }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    -- SpellBad     { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    -- SpellCap     { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare    { }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    -- StatusLine   { }, -- status line of current window
    -- StatusLineNC { }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    -- TabLine      { }, -- tab pages line, not active tab page label
    -- TabLineFill  { }, -- tab pages line, where there are no labels
    -- TabLineSel   { }, -- tab pages line, active tab page label
    Title        { bg = "NONE", fg = "Cyan" }, -- titles for output from ":set all", ":autocmd" etc.
    Visual       { bg = "Grey32",  }, -- Visual mode selection
    -- VisualNOS    { }, -- Visual mode selection when vim is "Not Owning the Selection".
    -- WarningMsg   { }, -- warning messages
    -- Whitespace   { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    -- WildMenu     { }, -- current match in 'wildmenu' completion

    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferred" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.

    -- Constant       { }, -- (preferred) any constant
    -- String         { }, --   a string constant: "this is a string"
    -- Character      { }, --  a character constant: 'c', '\n'
    -- Number         { }, --   a number constant: 234, 0xff
    -- Boolean        { }, --  a boolean constant: TRUE, false
    -- Float          { }, --    a floating point constant: 2.3e10

    Identifier     { }, -- (preferred) any variable name

    Statement      { bg = "NONE", fg = hsl("#ffff60").de(35), gui = "bold" }, -- (preferred) any statement
    -- Conditional    { }, --  if, then, else, endif, switch, etc.
    -- Repeat         { }, --   for, do, while, etc.
    -- Label          { }, --    case, default, etc.
    Operator       { bg = "NONE", fg = "NONE" }, -- "sizeof", "+", "*", etc.
    -- Keyword        { }, --  any other keyword
    -- Exception      { }, --  try, catch, throw

    PreProc        { bg = "NONE", fg= hsl("#ffff60").de(40)}, -- (preferred) generic Preprocessor
    --PreProc        { bg = "NONE", fg= hsl("#ff80ff").de(10)}, -- (preferred) generic Preprocessor
    -- Include        { }, --  preprocessor #include
    -- Define         { }, --   preprocessor #define
    -- Macro          { }, --    same as Define
    -- PreCondit      { }, --  preprocessor #if, #else, #endif, etc.

    Type           { bg = "NONE", fg = hsl("#60ff60").de(37), gui = "bold" }, -- (preferred) int, long, char, etc.
	Function       { }, -- function name (also: methods for classes)
    -- StorageClass   { }, -- static, register, volatile, etc.
    -- Structure      { }, --  struct, union, enum, etc.
    -- Typedef        { }, --  A typedef

     Special        { }, -- (preferred) any special symbol
    -- SpecialChar    { }, --  special character in a constant
    -- Tag            { }, --    you can use CTRL-] on this
    -- Delimiter      { }, --  character that needs attention
    -- SpecialComment { }, -- special things inside a comment
    -- Debug          { }, --    debugging statements

    -- Underlined { gui = "underline" }, -- (preferred) text that stands out, HTML links
    -- Bold       { gui = "bold" },
    -- Italic     { gui = "italic" },

    -- ("Ignore", below, may be invisible...)
    -- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|

    -- Error          { }, -- (preferred) any erroneous construct

    Todo           { bg = hsl("#ffff00").de(20), fg = "Grey10" }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

	--lualine_a_command { bg = "NONE", fg = "NONE" },

    -- These groups are for the native LSP client. Some other LSP clients may use
    -- these groups, or use their own. Consult your LSP client's documentation.

    -- LspDiagnosticsError               { }, -- used for "Error" diagnostic virtual text
    -- LspDiagnosticsErrorSign           { }, -- used for "Error" diagnostic signs in sign column
    -- LspDiagnosticsErrorFloating       { }, -- used for "Error" diagnostic messages in the diagnostics float
    -- LspDiagnosticsWarning             { }, -- used for "Warning" diagnostic virtual text
    -- LspDiagnosticsWarningSign         { }, -- used for "Warning" diagnostic signs in sign column
    -- LspDiagnosticsWarningFloating     { }, -- used for "Warning" diagnostic messages in the diagnostics float
    -- LspDiagnosticsInformation         { }, -- used for "Information" diagnostic virtual text
    -- LspDiagnosticsInformationSign     { }, -- used for "Information" signs in sign column
    -- LspDiagnosticsInformationFloating { }, -- used for "Information" diagnostic messages in the diagnostics float
    -- LspDiagnosticsHint                { }, -- used for "Hint" diagnostic virtual text
    -- LspDiagnosticsHintSign            { }, -- used for "Hint" diagnostic signs in sign column
    -- LspDiagnosticsHintFloating        { }, -- used for "Hint" diagnostic messages in the diagnostics float
    -- LspReferenceText                  { }, -- used for highlighting "text" references
    -- LspReferenceRead                  { }, -- used for highlighting "read" references
    -- LspReferenceWrite                 { }, -- used for highlighting "write" references

    -- These groups are for the neovim tree-sitter highlights.
    -- As of writing, tree-sitter support is a WIP, group names may change.
    -- By default, most of these groups link to an appropriate Vim group,
    -- TSError -> Error for example, so you do not have to define these unless
    -- you explicitly want to support Treesitter's improved syntax awareness.

    -- TSError              { }, -- For syntax/parser errors.
    -- TSPunctDelimiter     { }, -- For delimiters ie: `.`
    -- TSPunctBracket       { }, -- For brackets and parens.
    -- TSPunctSpecial       { }, -- For special punctutation that does not fall in the catagories before.
    -- TSConstant           { }, -- For constants
    -- TSConstBuiltin       { }, -- For constant that are built in the language: `nil` in Lua.
    -- TSConstMacro         { }, -- For constants that are defined by macros: `NULL` in C.
    -- TSString             { }, -- For strings.
    -- TSStringRegex        { }, -- For regexes.
    -- TSStringEscape       { }, -- For escape characters within a string.
    -- TSCharacter          { }, -- For characters.
    -- TSNumber             { }, -- For integers.
    -- TSBoolean            { }, -- For booleans.
    -- TSFloat              { }, -- For floats.
    -- TSFunction           { }, -- For function (calls and definitions).
    -- TSFuncBuiltin        { }, -- For builtin functions: `table.insert` in Lua.
    -- TSFuncMacro          { }, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    -- TSParameter          { }, -- For parameters of a function.
    -- TSParameterReference { }, -- For references to parameters of a function.
    -- TSMethod             { }, -- For method calls and definitions.
    -- TSField              { }, -- For fields.
    -- TSProperty           { }, -- Same as `TSField`.
    -- TSConstructor        { }, -- For constructor calls and definitions: `                                                                       { }` in Lua, and Java constructors.
    -- TSConditional        { }, -- For keywords related to conditionnals.
    -- TSRepeat             { }, -- For keywords related to loops.
    -- TSLabel              { }, -- For labels: `label:` in C and `:label:` in Lua.
    -- TSOperator           { }, -- For any operator: `+`, but also `->` and `*` in C.
    -- TSKeyword            { }, -- For keywords that don't fall in previous categories.
    -- TSKeywordFunction    { }, -- For keywords used to define a fuction.
    -- TSException          { }, -- For exception related keywords.
    -- TSType               { }, -- For types.
    -- TSTypeBuiltin        { }, -- For builtin types (you guessed it, right ?).
    -- TSNamespace          { }, -- For identifiers referring to modules and namespaces.
    -- TSInclude            { }, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
    -- TSAnnotation         { }, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
    -- TSText               { }, -- For strings considered text in a markup language.
    -- TSStrong             { }, -- For text to be represented with strong.
    -- TSEmphasis           { }, -- For text to be represented with emphasis.
    -- TSUnderline          { }, -- For text to be represented with an underline.
    -- TSTitle              { }, -- Text that is part of a title.
    -- TSLiteral            { }, -- Literal text.
    -- TSURI                { }, -- Any URI like a link or email.
    -- TSVariable           { }, -- Any variable name that does not have another highlight.
    TSVariableBuiltin    { Type }, -- Variable names that are defined by the languages, like `this` or `self`.
  }
end)
return theme
