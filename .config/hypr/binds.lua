local bind = hl.bind
local dsp = hl.dsp
local exec = hl.dsp.exec_cmd
local terminal = "alacritty"

bind("SUPER + SHIFT + C", dsp.window.close())
bind("SUPER + SHIFT + CTRL + Q", dsp.exit())
bind("SUPER + B", exec("killall -SIGUSR1 waybar"))

-- Application binds
bind("SUPER + O", exec("tofi-run | dash"))
bind("SUPER + SHIFT + RETURN", exec(terminal))
bind("Print", exec("screencopy"))
bind("CTRL + Print", exec("screencopy2"))
bind("SUPER + PRINT", exec("screensave"))
bind("SUPER + CTRL + PRINT", exec("screenwholesave"))
bind("ALT + PRINT", exec("screenshot-to"))
bind("SHIFT + Print", exec("screenshotwindow"))
bind("SUPER + A", exec("aniki"))
bind("SUPER + U", exec("bookmarks"))
bind("SUPER + SHIFT + A", exec("anki_audio"))

-- Float binds
bind("SUPER + SHIFT + S", function()
	hl.dispatch(dsp.window.float({ action = "on" }))
	hl.dispatch(dsp.window.center())
	hl.dispatch(dsp.window.resize({ x = 806, y = 604 }))
	-- hl.dispatch(dsp.window.resize({ x = "(monitor_w*0.42)", y = "(monitor_h*0.56)" }))
	-- size = { "(monitor_w*0.5)", "(monitor_h*0.5)" },
	-- bind=$modkey SHIFT,S,resizeactive,exact 42% 56%
	-- bind=$modkey SHIFT,S,centerwindow,
end)
bind("SUPER + SPACE", function()
	hl.dispatch(dsp.window.float())
	hl.dispatch(dsp.window.center())
end)

local home_env = os.getenv("HOME")

-- Scratch workspace binds
bind("SUPER + TAB", function()
	local window = hl.get_window("class:^TODO$")
	local wd = home_env .. "/Documents/notes"
	if window == nil then
		hl.dispatch(exec("alacritty --class TODO --working-directory " .. wd .. " -e nvim todo.txt", { workspace = "special:todo" }))
		hl.dispatch(hl.dsp.workspace.toggle_special("todo"))
	end

	hl.dispatch(hl.dsp.workspace.toggle_special("todo"))
end)

bind("SUPER + GRAVE", function()
	local window = hl.get_window("class:^SCRATCH1$")
	if window == nil then
		hl.dispatch(exec("alacritty --class SCRATCH1", { workspace = "special:scratch" }))
		hl.dispatch(hl.dsp.workspace.toggle_special("scratch"))
	end

	hl.dispatch(hl.dsp.workspace.toggle_special("scratch"))
end)

-- Master-stack binds
-- bind=$modkey,J,layoutmsg,cyclenext
-- bind=$modkey,K,layoutmsg,cycleprev
-- bind=$modkey,I,layoutmsg,addmaster
-- bind=$modkey,D,layoutmsg,removemaster
-- bind=$modkey,Y,layoutmsg,orientationtop
-- bind=$modkey,T,layoutmsg,orientationleft
-- bind=$modkey,return,layoutmsg,swapwithmaster master
-- bind=$modkey,return,layoutmsg,movetoroot active

-- Dwindle Binds
bind("SUPER + CTRL + H", dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
bind("SUPER + CTRL + L", dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
bind("SUPER + CTRL + J", dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
bind("SUPER + CTRL + K", dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
bind("SUPER + SHIFT + H", dsp.window.swap({ direction = "left" }))
bind("SUPER + SHIFT + L", dsp.window.swap({ direction = "right" }))
bind("SUPER + SHIFT + J", dsp.window.swap({ direction = "down" }))
bind("SUPER + SHIFT + K", dsp.window.swap({ direction = "up" }))
bind("SUPER + SHIFT + U", dsp.layout("rotatesplit"))
bind("SUPER + SHIFT + T", dsp.layout("togglesplit"))
bind("SUPER + SHIFT + Y", dsp.layout("swapsplit"))
bind("SUPER + RETURN", dsp.layout("movetoroot"))
bind("SUPER + H", dsp.focus({ direction = "left" }))
bind("SUPER + L", dsp.focus({ direction = "right" }))
bind("SUPER + J", dsp.focus({ direction = "down" }))
bind("SUPER + K", dsp.focus({ direction = "up" }))
bind("SUPER + SHIFT + N", dsp.window.cycle_next({ tiled = false }))
bind("SUPER + SHIFT + P", dsp.window.cycle_next({ next = false, tiled = false }))

bind("SUPER + N", dsp.focus({ workspace = "m+1" }))
bind("SUPER + P", dsp.focus({ workspace = "m-1" }))
bind("SUPER + ALT + h", dsp.window.move({ into_group = "left" }))
bind("SUPER + ALT + l", dsp.window.move({ into_group = "right" }))
bind("SUPER + ALT + k", dsp.window.move({ into_group = "up" }))
bind("SUPER + ALT + j", dsp.window.move({ into_group = "down" }))
bind("SUPER + ALT + o", dsp.window.move({ out_of_group = true }))
bind("SUPER + ALT + g", dsp.group.toggle())
bind("SUPER + ALT + n", dsp.group.next())
bind("SUPER + ALT + p", dsp.group.prev())

bind("SUPER + M", dsp.window.fullscreen_state({ internal = 1, client = 1, action = "toggle" }))

for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind("SUPER + " .. key, dsp.focus({ workspace = i}))
    hl.bind("SUPER + SHIFT + " .. key, dsp.window.move({ workspace = i, follow = false }))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Media key bindings
bind("SUPER + UP", exec("playerctl --player=mpd,clementine play-pause"))
bind("SUPER + RIGHT", exec("playerctl --player=mpd,clementine next"))
bind("SUPER + LEFT", exec("playerctl --player=mpd,clementine previous"))

bind("xf86launch1", exec("toggle_touch"))
bind("xf86monbrightnessup", exec("brightnessctl s +2%"), { repeating = true})
bind("xf86monbrightnessdown", exec("brightnessctl s 2-%"), { repeating = true})

bind("xf86audioraisevolume", exec("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+"), { repeating = true })
bind("xf86audiolowervolume", exec("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"), { repeating = true })
bind("XF86AudioMute", exec("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
bind("XF86AudioMicMute", exec("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))

bind("ALT + T", hl.dsp.submap("open_program"))
hl.define_submap("open_program", "reset", function()
    bind("p", exec("alacritty --class pulsemixer -e pulsemixer"))
    bind("f", exec("toggle_fcitx"))

    bind("catchall", hl.dsp.submap("reset"))
end)
