local create_user_command = vim.api.nvim_create_user_command

--                 cmd name          command           opts
create_user_command("Erc", "e ~/.config/nvim/init.lua", {})
create_user_command("R", "w | make!", {})
create_user_command("Rv", "w | make!", {})
create_user_command("Rh", "w | make!", {})

--create_user_command("R", "lua Run_make()", {})
--create_user_command("Rv", "vsp | lua Run_make()", {})
--create_user_command("Rh", "sp | lua Run_make()", {})

--function Run_make()
--	local cmd = vim.g.run
--
--	if cmd == nil or cmd == "" then
--		print("Please set 'run' variable (let run=CMD)")
--		return
--	end
--	local buf = vim.api.nvim_create_buf("", "")
--
--	--vim.cmd("w")
--	--vim.cmd("b " .. buf)
--
--	--vim.fn.termopen(cmd)
--	--vim.cmd("startinsert")
--end
