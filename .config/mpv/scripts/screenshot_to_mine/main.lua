local media_dir = os.getenv("HOME") .. "/Documents/other/japanese/minesite/media/"

function print_table(table)
	for k, v in pairs(table) do
		if type(v) == "table" then
			print_table(v)
		end
		print(k, v)
	end
end

function random_string_n(len)
	local charset = {}
	do -- [0-9a-zA-Z]
		for c = 48, 57 do
			table.insert(charset, string.char(c))
		end
		for c = 65, 90 do
			table.insert(charset, string.char(c))
		end
		for c = 97, 122 do
			table.insert(charset, string.char(c))
		end
	end

	local function randomString(length)
		if not length or length <= 0 then
			return ""
		end
		math.randomseed(os.clock() ^ 5)
		return randomString(length - 1) .. charset[math.random(1, #charset)]
	end
	return randomString(len)
end
function screenshot_me()
	local utils = require 'mp.utils'
	local file_name = random_string_n(64);

	local screenshot_name = string.format("%s.jpg", file_name)
	mp.commandv("screenshot-to-file", screenshot_name, "video")

	local cwd = utils.getcwd()

	local old_location = cwd .. "/" .. screenshot_name
	local new_location = media_dir

	os.execute(string.format([[magick convert -resize 1280x720 "%s" "%s"]], old_location, old_location))
	os.execute(string.format([[mv "%s" "%s"]], old_location, new_location))
	os.execute(string.format([[echo "%s" | xclip -i -selection clipboard]], screenshot_name))
end

mp.add_key_binding("ctrl+shift+s", screenshot_me)
