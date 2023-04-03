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


return M
