vim.filetype.add({
	extension = {
		kalk = 'kalker',
		kalker = 'kalker',
	},
})

local opts = { noremap = true, silent = true }
local bkeymap = vim.api.nvim_buf_set_keymap

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "kalker" },
	callback = function()
		vim.schedule(function()

			bkeymap(0, "v", "<CR>", "yPgv:!kalker<CR>", opts)
			bkeymap(0, "n", "<CR>", ":r!kalker < /usr/bin/echo '<C-R><C-L>'<CR>", opts)
			bkeymap(0, "n", "<C-p>", "vipyPgv:!kalker<CR>", opts)

			bkeymap(0, "i", "<C-k>", "<ESC>:r!kalker < /usr/bin/echo '<C-R><C-L>'<CR>A", opts)
			bkeymap(0, "i", "<C-p>", "<ESC>vipyPgv:!kalker<CR>A", opts)
		end)
	end
})
