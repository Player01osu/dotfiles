hl.monitor({
	output = "desc:InfoVision Optoelectronics (Kunshan) Co.Ltd China",
	mode = "1920x1080",
	position = "auto",
	scale = 1.0,
})

hl.monitor({
	output = "desc:GIGA-BYTE TECHNOLOGY CO. LTD. M27Q 21080B011574",
	mode = "highrr",
	position = "auto",
	scale = 1.0,
	bitdepth = 10,
	cm = "srgb",
})

hl.monitor({
	output = "desc:LG Electronics LG TV 0x01010101",
	mode = "highrr",
	position = "auto",
	scale = 1.0,

})

hl.monitor({
	output = "desc:Technical Concepts Ltd Fire TV",
	-- mode = "1920x1080@60",
	mode = "2560x1440@60",
	position = "auto",
	scale = 1.0,
	bitdepth = 10,
	cm = "wide",
})

hl.config({
	xwayland = {
		force_zero_scaling = true
	},

	input = {
		kb_layout = "us,pl",
		repeat_rate = 40,
		repeat_delay = 250,
		follow_mouse = 1,
		-- float_switch_override_focus = 0
		touchpad = {
			natural_scroll = false,
			tap_to_click = false,
			disable_while_typing = false,
		},

		force_no_accel = false,
		accel_profile = "flat",
	},

	general = {
		allow_tearing = false,
		gaps_in = 3,
		gaps_out = 4,
		border_size = 0,
		col = {
			active_border = {
				colors = {
					"rgba(33ccffee)",
					"rgba(00ff99ee)"
				},
				angle = 45
			},
			inactive_border = "rgba(595959aa)",
		},
		layout = "dwindle" -- master
	},

	cursor = {
		no_warps = true,
		inactive_timeout = 3,
	},

	decoration = {
		rounding = 10,
		shadow = {
			enabled = false,
			range = 10,
			render_power = 3,
			color = "rgba(1a1a1aee)",
		},
		dim_inactive = true,
		dim_strength = 0.3,
		blur = {
			enabled = false,
			size = 3,
			passes = 1,
			new_optimizations = on,
		}
	},

	group = {
		auto_group = false,
		groupbar = {
			enabled = true,
			font_size = 11,
			height = 16,
			rounding = 5,
			text_color = "rgba(cdd6f4ff)",
			col = {
				active = "rgba(090110ff)",
				inactive = "rgba(090110a0)",
			},
			gradients = true,
			gaps_out = 0,
			gaps_in = 0,
		},
	},

	animations = {
		enabled = false,
	},

	dwindle = {
		preserve_split = true,
		force_split = 2,
	},

	master = {
		new_on_top = false,
		new_status = "slave",
	},

	misc = {
		exit_window_retains_fullscreen = true,
		on_focus_under_fullscreen = 1,
		disable_hyprland_logo = false,
		force_default_wallpaper = -1,
		mouse_move_enables_dpms = true,
		key_press_enables_dpms = true,
		enable_anr_dialog = false,
	},

	debug = {
		disable_logs = false,
		vfr = true,
	}
})

-- hl.device = {
--     name = "opentabletdriver-virtual-artist-tablet",
--     output = "DP-1",
-- }

hl.device({
    name = "syna30d2:00-06cb:ce08-2",
    enabled = true,
    sensitivity = 0.7,
})

-- Smart gaps: https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/#smart-gaps
hl.workspace_rule({ workspace = "w[tv1]s[false]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]s[false]", gaps_out = 0, gaps_in = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]s[false]" }, border_size = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]s[false]" }, rounding = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]s[false]" }, border_size = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]s[false]" }, rounding = 0 })

require("startup")
require("env")
require("window-rules")
require("binds")
require("disable-edp")
