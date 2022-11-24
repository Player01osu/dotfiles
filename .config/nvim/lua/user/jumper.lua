local files = os.getenv("XDG_CACHE_HOME") .. "/nvim/jumps"

function add_jump(file)
	print(file)
	local out = io.open(files, 'a+');

	if (out == nil ) then
		print("Error")
		return
	end
	out:write("\nHI")

	out:close()
end

--add_jump("bruh")
