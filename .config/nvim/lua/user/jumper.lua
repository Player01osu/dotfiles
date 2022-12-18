local M = {}
local files = os.getenv("XDG_CACHE_HOME") .. "/nvim/jumps"

-- TODO Change jump location with diffing
M.add_jump = function(row, col, file)
	print(file)
	local out = io.open(files, "a+")

	if out == nil then
		error("Error opening file")
		return
	end
	local formatted = string.format("%s:%s %s\n", row, col, file)
	out:write(formatted)

	out:close()
end

M.add_jump_under_cursor = function()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	local file_path = vim.fn.expand("%:p")
	M.add_jump(row, col, file_path)
end

M.goto_jump_file = function()
	vim.cmd("e " .. files)
end

M.goto_jump = function()
	local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
	local line = unpack(vim.api.nvim_buf_get_lines(0, row - 1, row, true))

	local idx_cursor = string.find(line, ":")
	local idx_file = string.find(line, " ")
	local idx_comment = string.find(line, "--", 1, true)

	local row_goto = string.sub(line, 1, idx_cursor - 1)
	local col_goto = string.sub(line, idx_cursor + 1, idx_file)

	local file = string.sub(line, idx_file + 1)

	if idx_comment ~= nil then
		file = string.sub(line, idx_file + 1, idx_comment - 1)
	end

	local cmd = string.format("e %s | call cursor(%s,%s)", file, row_goto, col_goto + 1)
	vim.cmd('bd')
	vim.cmd(cmd)
end

vim.filetype.add({
	filename = {
		[files] = "jumper",
	},
})

local bkeyset = vim.keymap.set
local optsb = { noremap = true, silent = true, buffer = 0 }

local function keymaps()
	bkeyset("n", "<CR>", function()
		M.goto_jump()
	end, optsb)
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "jumper" },
	callback = function()
		keymaps()
	end,
})

return M
