mainMod = "SUPER"

----------------
-- Navigation --
----------------
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "d" }))

hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())

----------------
-- Workspaces --
----------------
hl.bind(mainMod .. " + Return", hl.dsp.focus({ workspace = "1" }))
hl.bind(mainMod .. " + SHIFT + Return", hl.dsp.window.move({ workspace = "1", follow = false }))

hl.bind(mainMod .. " + N", hl.dsp.focus({ workspace = "2" }))
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.window.move({ workspace = "2", follow = false }))

hl.bind(mainMod .. " + M", hl.dsp.focus({ workspace = "3" }))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.window.move({ workspace = "3", follow = false }))

hl.bind(mainMod .. " + B", hl.dsp.focus({ workspace = "4" }))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.window.move({ workspace = "4", follow = false }))

hl.bind(mainMod .. " + P", hl.dsp.focus({ workspace = "5" }))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.window.move({ workspace = "5", follow = false }))

hl.bind(mainMod .. " + Z", hl.dsp.focus({ workspace = "6" }))
hl.bind(mainMod .. " + SHIFT + Z", hl.dsp.window.move({ workspace = "6", follow = false }))

hl.bind(mainMod .. " + U", hl.dsp.focus({ workspace = "7" }))
hl.bind(mainMod .. " + SHIFT + U", hl.dsp.window.move({ workspace = "7", follow = false }))

hl.bind(mainMod .. " + O", hl.dsp.focus({ workspace = "8" }))
hl.bind(mainMod .. " + SHIFT + O", hl.dsp.window.move({ workspace = "8", follow = false }))
hl.window_rule({ match = { class = "thunderbird" }, workspace = "8 silent" })

hl.bind(mainMod .. " + I", hl.dsp.focus({ workspace = "9" }))
hl.bind(mainMod .. " + SHIFT + I", hl.dsp.window.move({ workspace = "9", follow = false }))
hl.window_rule({ match = { class = "slack" }, workspace = "9 silent" })
hl.window_rule({ match = { class = "discord" }, workspace = "9 silent" })

hl.bind(mainMod .. " + W", hl.dsp.focus({ workspace = "10" }))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.window.move({ workspace = "10", follow = false }))
hl.window_rule({ match = { class = "steam" }, workspace = "10 silent" })

-- Number row fallback
for i = 1, 9 do
	hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = tostring(i) }))
	hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = tostring(i) }))
end
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = "10" }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = "10" }))

-- Special workspace
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- ======================
-- GENERAL BINDS
-- ======================
hl.bind(mainMod .. " + CTRL + Return", hl.dsp.exec_cmd(Terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(FileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(Menu))

hl.bind(mainMod .. " + Backspace", hl.dsp.exec_cmd("makoctl dismiss"))
hl.bind(mainMod .. " + CTRL + Backspace", hl.dsp.exec_cmd("makoctl dismiss --all"))

hl.bind(mainMod .. " + CTRL + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))

-- ======================
-- MEDIA KEYS
-- ======================
-- Volume (repeating while held)
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
-- Mute
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })
-- Brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"))
-- Media Player Controls
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
