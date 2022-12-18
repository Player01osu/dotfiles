vim.filetype.add({
	extension = {
		sbcli = "CommonLispInterpretter",
		sbcl = "CommonLispInterpretter",
	},
})

local opts = { noremap = true, silent = true }
local bkeymap = vim.api.nvim_buf_set_keymap

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "CommonLispInterpretter" },
	callback = function()
		vim.schedule(function()
			bkeymap(0, "v", "<CR>", "yPgv:!sbcl --noinform | sed s/\\*//g<CR><<", opts)
			bkeymap(0, "n", "<CR>", ":r!/usr/bin/echo '<C-R><C-L>'| sbcl --noinform | sed s/\\*//g<CR>dd<<", opts)
			bkeymap(0, "n", "<C-p>", "vipyPgv:!sbcl --noinform | sed s/\\*//g<CR><<", opts)

			bkeymap(
				0,
				"i",
				"<C-K>",
				"<ESC>:r!/usr/bin/echo '<C-R><C-L>'| sbcl --noinform | sed s/\\*//g<CR>dd<<A",
				opts
			)
			bkeymap(0, "i", "<C-p>", "<ESC>vipyPgv:!sbcl --noinform | sed s/\\*//g<CR><<A", opts)
			vim.opt_local.expandtab = true
			vim.opt_local.shiftwidth = 4
			vim.opt_local.softtabstop = 4
			vim.opt_local.tabstop = 4
			vim.opt_local.lisp = true
		end)
	end,
})
