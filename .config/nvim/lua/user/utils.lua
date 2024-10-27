local M = {}

M.split_string = function(inputstr, sep)
        if sep == nil then
                sep = "%s"
        end
        local t={}
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                table.insert(t, str)
        end
        return t
end

--- Check if a file or directory exists in this path
M.exists = function(file)
   local ok, err, code = os.rename(file, file)
   if not ok then
      if code == 13 then
         -- Permission denied, but it exists
         return true
      end
   end
   return ok, err
end

--- Check if a directory exists in this path
M.isdir = function(path)
   -- "/" works on both Unix and Windows
   return M.exists(path.."/")
end

-- Stolen from Telescope.nvim
--
-- Fix regex
M.oldfiles = function(a, l, p)
	-- TODO
	local current_buffer = vim.api.nvim_get_current_buf()
	local current_file = vim.api.nvim_buf_get_name(current_buffer)
	local results = {}

	for _, buffer in ipairs(vim.split(vim.fn.execute ":buffers! t", "\n")) do
		local match = tonumber(string.match(buffer, "%s*(%d+)"))
		local open_by_lsp = string.match(buffer, "line 0$")
		if match and not open_by_lsp then
			local file = vim.api.nvim_buf_get_name(match)
			if vim.loop.fs_stat(file) and match ~= current_buffer then
				table.insert(results, file)
			end
		end
	end

	for _, file in ipairs(vim.v.oldfiles) do
		if vim.loop.fs_stat(file) and not vim.tbl_contains(results, file) and file ~= current_file then
			table.insert(results, file)
		end
	end

	local s = ""
	for idx, file in ipairs(results) do
		if idx > 12 then
			break;
		end
		if string.len(s) == 0 then
			s = file
		end

		s = s.."\n"..file
	end

	return s
end

--- Get the range of the current visual selection.
--
-- The range start with 1 and the ending is inclusive.
M.visual_selection_range = function()
	local _, csrow, cscol, _ = unpack(vim.fn.getpos("'<"))
	local _, cerow, cecol, _ = unpack(vim.fn.getpos("'>"))

	local start_row, start_col, end_row, end_col

	if csrow < cerow or (csrow == cerow and cscol <= cecol) then
		start_row = csrow
		start_col = cscol
		end_row = cerow
		end_col = cecol
	else
		start_row = cerow
		start_col = cecol
		end_row = csrow
		end_col = cscol
	end

	return start_row, start_col, end_row, end_col
end

M.visual_selection_text = function() end

M.visual_selection_array = function()
	vim.cmd(vim.api.nvim_replace_termcodes("normal <ESC>", true, true, true))
	local row_1, col_1, row_2, col_2 = M.visual_selection_range()
	row_1 = row_1 - 1
	col_1 = col_1 - 1
	row_2 = row_2 - 1

	local lines_array = nil
	if col_2 > 2147483646 then
		lines_array = vim.api.nvim_buf_get_lines(0, row_1, row_2 + 1, true)
	else
		lines_array = vim.api.nvim_buf_get_text(0, row_1, col_1, row_2, col_2, {})
	end

	return lines_array
end

return M
