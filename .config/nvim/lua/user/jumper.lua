local M = {}
local files = os.getenv("XDG_CACHE_HOME") .. "/nvim/jumps"

-- TODO Change jump location with diffing
M.add_jump = function(row, col, file)
	local out = io.open(files, "a+")

	if out == nil then
		error("Error opening file")
		return
	end
	local formatted = string.format("%s:%s:%s\n", file, row, col)
	out:write(formatted)
	out:close()

	print("Jump added")
end

M.add_jump_under_cursor = function()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	local file_path = vim.fn.expand("%:p")
	M.add_jump(row, col, file_path)
end

M.goto_jump_file = function()
	vim.cmd("e " .. files)
end

M.goto_latest_jump = function()
	local file_path = vim.fn.expand("%:p")
	M.goto_jump_file()
	vim.cmd.norm([[GgF]])
	if file_path ~= "" then
		vim.cmd.e(file_path)
		vim.cmd.norm([[]])
	end
	vim.cmd.bwipeout(files)
end

M.remove_latest_jump = function()
	local Job = require'plenary.job'

	Job:new({
		command = 'sed',
		args = { '$d', files },
		on_exit = function(j, _)
			local data = ""
			for _, value in ipairs(j:result()) do
				data = string.format("%s%s\n", data, value)
			end

			local out = io.open(files, "w")

			if out == nil then
				error("Error opening file")
				return
			end
			out:write(data)
			out:close()
		end,
		}):start() -- or sync()
	print("Jump removed")
end

return M
