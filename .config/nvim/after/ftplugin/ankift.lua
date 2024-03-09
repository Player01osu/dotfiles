local opts = { noremap = true, silent = true }

vim.opt_local.smartindent = false
vim.opt_local.smartcase = true
vim.opt_local.ignorecase = true

local image_path = os.getenv("XDG_DATA_HOME") .. "/Anki2/User 1/collection.media/"

vim.keymap.set("n", "<leader><leader>i", function()
	local Job = require'plenary.job'
	local filename = vim.fn.getreg("+")
	Job:new({
		command = 'nsxiv',
		args = { image_path .. "/" .. filename },
		}):start() -- or sync()
end, opts)
