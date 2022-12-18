vim.filetype.add({
	extension = {
		kalk = "kalker",
		kalker = "kalker",
	},
})

local optsb = { noremap = true, silent = true, buffer = 0 }
local bkeyset = vim.keymap.set

local function global_var(lines)
	lines = string.gsub(lines, "^%s*(.-)%s*$", "%1")
	vim.g.kalker_globals = vim.g.kalker_globals .. lines .. "\n"
end

local function kalker(lines)
	local args = '"' .. vim.g.kalker_globals .. lines .. '"'
	local handle = io.popen("kalker " .. args)
	if handle == nil then
		error("Kalker failed")
		return
	end
	local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
	for l in handle:lines() do
		vim.api.nvim_buf_set_lines(0, row, row, false, { l })
		row = row + 1
	end
	vim.api.nvim_win_set_cursor(0, { row, 1000 })
end

local lib = require("user.lib")

local function visual_global_var()
	local lines_array = lib.visual_selection_array()

	local lines = ""
	for _, line in pairs(lines_array) do
		lines = lines .. line .. "\n"
	end
	global_var(lines)
end

local function visual_kalker()
	local lines_array = lib.visual_selection_array()

	local lines = ""
	for _, line in pairs(lines_array) do
		lines = lines .. line .. "\n"
	end
	kalker(lines)
end

local function keymaps()
	bkeyset("v", "<CR>", function()
		visual_kalker()
	end, optsb)

	bkeyset("n", "<CR>", function()
		local line = vim.api.nvim_get_current_line()
		kalker(line)
	end, optsb)

	bkeyset("n", "<C-p>", function()
		vim.cmd(vim.api.nvim_replace_termcodes("normal vip", true, true, true))
		visual_kalker()
	end, optsb)

	bkeyset("i", "<C-k>", function()
		local line = vim.api.nvim_get_current_line()
		kalker(line)
	end, optsb)

	bkeyset("i", "<C-p>", function()
		vim.cmd(vim.api.nvim_replace_termcodes("normal <ESC>vip", true, true, true))
		visual_kalker()
	end, optsb)

	bkeyset("n", "gV", function()
		local line = vim.api.nvim_get_current_line()
		global_var(line)
	end, optsb)

	bkeyset("v", "gV", function()
		visual_global_var()
	end, optsb)
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "kalker" },
	callback = function()
		vim.schedule(function()
			vim.g.kalker_globals = ""
			vim.opt_local.laststatus = 0
			vim.opt_local.cmdheight = 0
			vim.opt_local.tabstop = 4
			vim.opt_local.softtabstop = 4
			vim.opt_local.shiftwidth = 4
			vim.opt_local.expandtab = true
			keymaps()
		end)
	end,
})
