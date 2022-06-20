--vim.opt.listchars:append("space:⋅")
vim.opt.list = true

--vim.cmd([[
--	set listchars+=tab:▓·
--]])
require("indent_blankline").setup {
    show_trailing_blankline_indent = false,
    --char = "|",
    show_end_of_line = true,
    space_char_blankline = " ",
}
