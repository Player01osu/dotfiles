vim.api.nvim_create_autocmd("FileType", {
	pattern = {"haskell"},
	callback = function()
		vim.schedule(function()
			vim.opt.tabstop = 3
			vim.opt.softtabstop = 3
			vim.opt.shiftwidth = 3
			vim.opt.expandtab = true
		end)
	end
})
