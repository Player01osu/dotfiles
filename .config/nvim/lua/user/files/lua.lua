vim.api.nvim_create_autocmd("FileType", {
	pattern = { "lua" },
	callback = function()
		vim.schedule(function()
			vim.opt_local.expandtab = false
		end)
	end,
})
