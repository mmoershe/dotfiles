-- local MAIN_MONITOR = "HDMI-A-1"
local MAIN_MONITOR = "DP-1"
local SECONDARY_MONITOR = "eDP-1"

hl.monitor({
	output = MAIN_MONITOR,
	mode = "2560x1440@59.95",
	position = "0x0",
	scale = 1,
})

hl.monitor({
	output = SECONDARY_MONITOR,
	mode = "1920x1080@60",
	position = "0x1440",
	scale = 1,
})

for i = 1, 10 do
	hl.workspace_rule({ workspace = tostring(i), monitor = MAIN_MONITOR, default = (i == 1) })
end

hl.bind(mainMod .. "+ SHIFT + CTRL + 1", hl.dsp.workspace.move({ monitor = MAIN_MONITOR }))
hl.bind(mainMod .. "+ SHIFT + CTRL + 2", hl.dsp.workspace.move({ monitor = SECONDARY_MONITOR }))
