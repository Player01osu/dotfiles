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
create_user_command("R", "w | make!", {})
create_user_command("M", "make!", {})
create_user_command("Rv", "w | make!", {})
create_user_command("Rh", "w | make!", {})
create_user_command("Oil", "lua require(\"oil\").open()", {})
create_user_command("Norg", "e ~/Documents/org/index.norg", {})
create_user_command("C",
	function(opts)
		local cmd = ""
		for _, v in ipairs(opts.fargs) do
			cmd = string.format("%s %s", cmd, v)
		end
		vim.cmd(string.format([[cexpr! system('%s')]], string.gsub(cmd, [[']], [['']])))

		--local cmd_output = vim.fn.system(cmd)
		--local sanitized = string.format([['%s']], string.gsub(
		--	cmd_output,
		--	[[']], [['']]))
		--vim.cmd.cexpr(sanitized)
	end,
	{ nargs = "+",
	  complete = "shellcmd"})

create_user_command("L",
	function(opts)
		local cmd = ""
		for _, v in ipairs(opts.fargs) do
			cmd = string.format("%s %s", cmd, v)
		end

		local cmd_output = vim.fn.system(cmd)
		vim.cmd.lexpr(string.format([['%s']], cmd_output))
	end,
	{ nargs = "+",
	  complete = "shellcmd"})

