--[[
vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
local colors = require("catppuccin.palettes").get_palette()
colors.none = "NONE"
require("catppuccin").setup({
	compile_path = vim.fn.stdpath "cache" .. "/catppuccin",
	transparent_background = true,
	term_colors = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false
	},
	--custom_highlights = {
	--	Comment = { fg = colors.overlay1 },
	--	LineNr = { fg = colors.overlay1 },
	--	CursorLine = { bg = colors.overlay1, fg = colors.overlay1 },
	--	CursorLineNr = { fg = colors.lavender },
	--	DiagnosticVirtualTextError = { bg = colors.none },
	--	DiagnosticVirtualTextWarn = { bg = colors.none },
	--	DiagnosticVirtualTextInfo = { bg = colors.none },
	--	DiagnosticVirtualTextHint = { bg = colors.none },
	--}
})
vim.api.nvim_command "colorscheme catppuccin"
--]]

require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
	transparent_background = true,
	term_colors = false,
	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.15,
	},
	no_italic = false, -- Force no italic
	no_bold = false, -- Force no bold
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	color_overrides = {},
	custom_highlights = {},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		telescope = true,
		notify = false,
		mini = false,
		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	},
})

-- setup must be called before loading
--vim.cmd.colorscheme("catppuccin")
