vim.filetype.add({
	extension = {
		kalk = 'kalker',
		kalker = 'kalker',
	},
})

local opts = { noremap = true, silent = true }
local optsb = { noremap = true, silent = true, buffer = 0 }
local bkeymap = vim.api.nvim_buf_set_keymap
local bkeyset = vim.keymap.set

local function global_var()
	local line = vim.api.nvim_get_current_line()
	print(line)
end

local function kalker(lines)
	local args = "\"" .. lines .. "\""
	local handle = io.popen("kalker " .. args)
	if handle == nil then
		error("Kalker failed")
		return
	end
	local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
	for l in handle:lines() do
		vim.api.nvim_buf_set_lines(0, row, row, false, { l })
		row = row + 1
		print(l)
	end
	vim.api.nvim_win_set_cursor(0, { row, 1000 })
end

local function keymaps()
	bkeymap(0, "v", "<CR>", "yPgv:!kalker<CR>", opts)
	--bkeyset("v", "<CR>", function()
	--	--vim.api.nvim_feedkeys("<ESC>", 'n', false)
	--	local start_row,_ = unpack(vim.api.nvim_buf_get_mark(0, '<'))
	--	local end_row,_ = unpack(vim.api.nvim_buf_get_mark(0, '>'))
	--	local lines = unpack(vim.api.nvim_buf_get_lines(0, start_row - 1, end_row, false))
	--	print(lines)
	--	--kalker(lines)
	--end, optsb)

	bkeyset("n", "<CR>", function()
		local line = vim.api.nvim_get_current_line()
		kalker(line)
	end, optsb)

	bkeymap(0, "n", "<C-p>", "vipyPgv:!kalker<CR>", opts)

	bkeyset("i", "<C-k>", function()
		local line = vim.api.nvim_get_current_line()
		kalker(line)
	end, optsb)

	bkeymap(0, "i", "<C-p>", "<ESC>vipyPgv:!kalker<CR>A", opts)

	--bkeyset("n", "gV", function() global_var() end, optsb)
	bkeyset("n", "gV", function()
		local line = vim.api.nvim_get_current_line()
		kalker(line)
	end, optsb)
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "kalker" },
	callback = function()
		vim.schedule(function()
			keymaps()
		end)
	end
})
