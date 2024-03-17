vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = {
		"*pettycc/**.c",
		"*pettycc/**.h",
	},
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.softtabstop = 4
		vim.opt_local.shiftwidth = 4
		vim.opt_local.expandtab = true
	end,
})
