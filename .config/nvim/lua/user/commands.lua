local create_user_command = vim.api.nvim_create_user_command

--                 cmd name          command           opts
create_user_command("Erc", "e ~/.config/nvim/init.lua", {})
create_user_command("R", "lua run_make()", {})
create_user_command("Rv", "vsp | lua run_make()", {})
create_user_command("Rh", "sp | lua run_make()", {})

function run_make()
	local cmd = vim.g.run

	if cmd == nil or cmd == "" then
		print("Please set 'run' variable (let run=CMD)")
		return
	end
	local buf = vim.api.nvim_create_buf("", "")

	vim.cmd("w")
	vim.cmd("b " .. buf)

	vim.fn.termopen(cmd)
	vim.cmd("startinsert")
end
