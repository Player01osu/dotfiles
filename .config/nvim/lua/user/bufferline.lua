vim.opt.termguicolors = true
require("bufferline").setup({
	options = {
		separator_style = { "", "" },
		indicator = {
			icon = "",
			style = "icon",
		},
		show_buffer_close_icons = false,
		show_buffer_icons = false, -- disable filetype icons for buffers
		show_close_icon = false,
		show_tab_indicators = false,
	},
})

require("transparent").setup({
	enable = true,
	extra_groups = {
		-- akinsho/nvim-bufferline.lua
		"BufferLineTabClose",
		"BufferLineFill",
		"BufferLineBackground",
		"BufferLineSeparator",
		"BufferLineIndicatorSelected",
	},
})
