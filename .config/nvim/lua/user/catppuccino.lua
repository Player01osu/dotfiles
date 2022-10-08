vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
local colors = require("catppuccin.palettes").get_palette()
colors.none = "NONE"
require("catppuccin").setup({
	compile_path = vim.fn.stdpath "cache" .. "/catppuccin",
	transparent_background = true,
	custom_highlights = {
		Comment = { fg = colors.overlay1 },
		LineNr = { fg = colors.overlay1 },
		CursorLine = { bg = colors.none },
		CursorLineNr = { fg = colors.lavender },
		DiagnosticVirtualTextError = { bg = colors.none },
		DiagnosticVirtualTextWarn = { bg = colors.none },
		DiagnosticVirtualTextInfo = { bg = colors.none },
		DiagnosticVirtualTextHint = { bg = colors.none },
	}
})
vim.api.nvim_command "colorscheme catppuccin"
