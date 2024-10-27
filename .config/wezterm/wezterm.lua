local wezterm = require 'wezterm'
local config = wezterm.config_builder()
-- config.color_scheme = 'AdventureTime'
config.font = wezterm.font {
	family = 'JetBrains Mono',
	harfbuzz_features = {"calt=0", "clig=0", "liga=0"}
}
config.window_background_opacity = 0.81
config.enable_wayland = true
config.enable_tab_bar = false
config.colors = {
	-- The default text color
	foreground = '#CDD6F4',
	-- The default background color
	background = '#090110',

	ansi = {
		'#45475A', -- black
		'#ffa0a0', -- red
		'#62fd62', -- green
		'#ffff00', -- yellow
		'#80a0ff', -- blue
		'#ff80ff', -- magenta
		'#00ffff', -- cyan
		'#BAC2DE', -- white
	},

	brights = {
		'#45475A', -- black
		'#ffa0a0', -- red
		'#62fd62', -- green
		'#ffff00', -- yellow
		'#80a0ff', -- blue
		'#ff80ff', -- magenta
		'#00ffff', -- cyan
		'#BAC2DE', -- white
	},

	cursor_bg = '#EDEDED',
	-- Overrides the text color when the current cell is occupied by the cursor
	cursor_fg = '#1E1E2E',
}

config.cursor_blink_rate = 500
config.font_size = 12

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

return config
