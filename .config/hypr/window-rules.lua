hl.window_rule({
	name = "dmenu",
	match = {
		class = "dmenu"
	},
	float = true,
	move = {0, 0},
	center = true,
	no_dim = true,
	animation = "slide",
	stay_focused = true,
	rounding = 0,
	pin = 1,
})

hl.window_rule({
	name = "mpv",
	match = {
		class = "mpv",
	},
	float = true,
	no_dim = true,
})

hl.window_rule({
	name = "aniki",
	match = {
		class = "aniki",
	},
	float = true,
})

hl.window_rule({
	name = "osu!stable",
	match = {
		class = "osu.exe"
	},
	fullscreen = true,
	immediate = true,
})

hl.window_rule({
	name = "alacritty",
	match = {
		class = "Alacritty",
		title = "Alacritty",
	},
	tile = true,
})

-- Floating window rules
hl.window_rule({
	match = {
		title = "^(Browse)(.*)",
	},
	float = true,
	size = { "(monitor_w*0.5)", "(monitor_h*0.5)" },
	center = true,
})

hl.window_rule({
	match = {
		class = "pulsemixer",
	},
	float = true,
	size = { "(monitor_w*0.5)", "(monitor_h*0.5)" },
	center = true,
})

hl.window_rule({
	match = {
		class = "^TODO$",
	},
	float = true,
	workspace = "special:todo",
})

hl.window_rule({
	match = {
		class = "^SCRATCH1$",
	},
	float = true,
	workspace = "special:scratch",
})

hl.window_rule({
	match = {
		class = "hyprfloat",
	},
	float = true,
	stay_focused = true,
})

hl.window_rule({
	match = {
		class = "swayimg",
	},
	float = true,
	stay_focused = true,
})

hl.window_rule({
	match = {
		class = "TESTING",
	},
	float = true,
	stay_focused = true,
})

hl.window_rule({
	match = {
		title = "TESTING",
	},
	float = true,
	stay_focused = true,
})

hl.window_rule({
	match = {
		class = "scratch",
	},
	float = true,
	stay_focused = true,
})

hl.window_rule({
	match = {
		class = "fcitx",
	},
	no_dim = true,
	float = true,
	no_initial_focus = true,
})

hl.window_rule({
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})
