local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
	cond = hide_in_width,
}

local mode = {
	"mode",
	icods_enabled = false,
	icon = nil,
}

-- FIXME
local filename = function()
	local path = vim.fn.expand("%:p")
	local trunc_len = 30
	local function str_truncate(str, n)
		if string.len(str) < n then
			return str
		end
		return str_truncate(string.sub(str, 2), n)
	end

	local win_width = vim.fn.winwidth(0)

	if win_width < 70 then
		local new_trunc = trunc_len - 3 - (win_width / 4)
		if path.len - new_trunc < 1 then
			return ""
		end
		return "..." .. str_truncate(path, new_trunc)
	end

	if string.len(path) > trunc_len then
		return "..." .. str_truncate(path, trunc_len - 3)
	end

	return path
end

local filetype = {
	"filetype",
	icons_enabled = true,
	icon = nil,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = {
	"location",
	padding = 1,
}

-- cool function for progress
local progress = {
	"progress",
	icon = nil,
}
--local progress = function()
--	local current_line = vim.fn.line(".")
--	local total_lines = vim.fn.line("$")
--	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
--	local line_ratio = current_line / total_lines
--	local index = math.ceil(line_ratio * #chars)
--	return chars[index]
--end

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline", "kalker", "CommonLispInterpretter" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { branch, diff },
		lualine_c = { diagnostics },
		-- lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_x = { filename, filetype },
		lualine_y = { progress },
		lualine_z = { location },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
