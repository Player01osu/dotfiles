local create_user_command = vim.api.nvim_create_user_command

--local function cope_run(arg_table)
--	print(arg_table.args)
--	if arg_table.args == nil then
--		return
--	end
--	--vim.cmd.cexpr(arg_table.args)
--end

--                 cmd name          command           opts
create_user_command("Erc", "e ~/.config/nvim/init.lua", {})
create_user_command("M", "make!", {})
create_user_command("Oil", [[lua require("oil").open()]], {})
create_user_command("Norg", "e ~/Documents/org/index.norg", {})
