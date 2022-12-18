local M = {}
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
