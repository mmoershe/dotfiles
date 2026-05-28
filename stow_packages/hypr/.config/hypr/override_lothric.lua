local MAIN_MONITOR = "DP-2"
local SECONDARY_MONITOR = "HDMI-A-2"

hl.monitor({
	output = MAIN_MONITOR,
	mode = "3440x1440@179.99",
	position = "0x0",
	scale = 1,
})

hl.monitor({
	output = SECONDARY_MONITOR,
	mode = "1920x1080@60.00000",
	position = "3440x0",
	scale = 1,
})

for i = 1, 10 do
	hl.workspace_rule({ workspace = tostring(i), monitor = MAIN_MONITOR, default = (i == 1) })
end

hl.bind(mainMod .. "+ SHIFT + CTRL + 1", hl.dsp.workspace.move({ monitor = MAIN_MONITOR }))
hl.bind(mainMod .. "+ SHIFT + CTRL + 2", hl.dsp.workspace.move({ monitor = SECONDARY_MONITOR }))
