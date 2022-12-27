local M = {}
local lib = require("user.lib")
local optsb = { noremap = true, silent = true, buffer = 0 }
local bkeyset = vim.keymap.set

M.hoppable = function(text_obj)
	if string.find(text_obj, "neorg.links.+", 1, false) == nil then
		return false
	end
	return true

	--return text_obj == "neorg.links.file" or text_obj == "neorg.links.location.delimiter" or
	--		text_obj == "neorg.links.file.delimiter" or text_obj == "neorg.links.description"
end

local function create_link()
	local start_row, start_col, end_row, end_col = lib.visual_selection_range()
	start_row = start_row - 1
	start_col = start_col - 1
	end_row = end_row - 1

	if end_col > 2147483646 then
		local line = vim.api.nvim_buf_get_lines(0, start_row, end_row + 1, true)
		local len = string.len(unpack(line))
		end_col = len
	end

	local text = vim.api.nvim_buf_get_text(0, start_row, start_col, end_row, end_col, {})
	local string = string.format("{:%s:}", unpack(text))
	vim.api.nvim_buf_set_text(0, start_row, start_col, end_row, end_col, { string })
end

M.normal_create_link = function()
	local captures = vim.treesitter.get_captures_at_cursor()
	for _, text_obj in ipairs(captures) do
		if M.hoppable(text_obj) then
			vim.cmd("w | Neorg keybind norg core.norg.esupports.hop.hop-link")
			return
		end
	end

	vim.cmd(vim.api.nvim_replace_termcodes("norm viW<esc>", true, true, true))
	create_link()
end

local function keymaps()
	bkeyset("n", "<leader><CR>", function()
		M.normal_create_link()
	end, optsb)

	bkeyset("n", "<leader>U", function()
		local captures = vim.treesitter.get_captures_at_cursor()
		for _, text_obj in ipairs(captures) do
			print(text_obj)
		end
	end, optsb)

	bkeyset("v", "<CR>", function()
		vim.cmd(vim.api.nvim_replace_termcodes("norm <esc>", true, true, true))
		create_link()
	end, optsb)
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "norg" },
	callback = function()
		vim.schedule(function()
			vim.opt_local.tabstop = 2
			vim.opt_local.softtabstop = 2
			vim.opt_local.shiftwidth = 2
			vim.opt_local.expandtab = true
			keymaps()
		end)
	end,
})

return M
