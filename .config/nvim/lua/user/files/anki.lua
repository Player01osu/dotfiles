local M = {}

vim.filetype.add({
	extension = {
		nanki = 'Nanki',
	},
})

local opts = { noremap = true, silent = true }
local bkeymap = vim.api.nvim_buf_set_keymap

local bkeyset = vim.keymap.set
local optsb = { noremap = true, silent = true, buffer = 0 }


--- Get the range of the current visual selection.
--
-- The range start with 1 and the ending is inclusive.
local function visual_selection_range()
	local _, csrow, cscol, _ = unpack(vim.fn.getpos "'<")
	local _, cerow, cecol, _ = unpack(vim.fn.getpos "'>")

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

local function visual_tag_set()
	vim.cmd(vim.api.nvim_replace_termcodes('normal <ESC>', true, true, true))
	visual_selection_range()
	local row_1, col_1, row_2, col_2 = visual_selection_range()
	row_1 = row_1 - 1
	col_1 = col_1 - 1
	row_2 = row_2 - 1
	vim.g.anki_tag = unpack(vim.api.nvim_buf_get_text(0, row_1, col_1, row_2, col_2, {}))
end

local function append_tag()
	local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
	local buf = unpack(vim.api.nvim_buf_get_lines(0, row - 1, row, false)) .. "; " .. vim.g.anki_tag
	vim.api.nvim_buf_set_lines(0, row - 1, row, false, { buf })
end



vim.api.nvim_create_autocmd("FileType", {
	pattern = { "Nanki" },
	callback = function()
		vim.schedule(function()
			vim.g.anki_tag = ""
			bkeymap(0, "n", "<C-k>", "yyp_dt;lvt;p0P<<o<esc>", opts)
			bkeymap(0, "i", "<C-k>", "<esc>yyp_dt;lvt;p0P<<o", opts)
			bkeyset("v", "<CR>", function()
				visual_tag_set()
			end, optsb)
			bkeyset("i", "<C-g>", function()
				append_tag()
			end, optsb)

			vim.opt_local.expandtab = true
			vim.opt_local.shiftwidth = 4
			vim.opt_local.softtabstop = 4
			vim.opt_local.tabstop = 4
			vim.opt_local.spell = true
		end)
	end
})
return M
