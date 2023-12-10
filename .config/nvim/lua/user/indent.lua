vim.opt.list = true
vim.opt.listchars = {
	tab = "⟩ ",
	trail = "+",
	space = "·",
	nbsp = "␣",
	--extends = ">",
	--precedes = "<",
}

--[[
local function update_lead()
	local lcs = vim.opt_local.listchars:get()
	local tab = vim.fn.str2list(lcs.tab)
	local space = vim.fn.str2list(lcs.multispace or lcs.space)
	local lead = {tab[1]}
	for i = 1, vim.bo.tabstop-1 do
		lead[#lead+1] = space[i % #space + 1]
	end
	vim.opt_local.listchars:append({ leadmultispace = vim.fn.list2str(lead) })
end
vim.api.nvim_create_autocmd("OptionSet", { pattern = { "listchars", "tabstop", "filetype" }, callback = update_lead })
vim.api.nvim_create_autocmd("VimEnter", { callback = update_lead, once = true })
--]]
