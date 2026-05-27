hl.on("hyprland.start", function()
	hl.exec_cmd("waybar")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("blueman-applet")
	hl.exec_cmd("hypridle")

	hl.exec_cmd("kitty", { workspace = "1" })
	hl.exec_cmd("kitty", { workspace = "2" })
	hl.exec_cmd("firefox", { workspace = "4" })

	hl.dispatch(hl.dsp.focus({ workspace = "1" }))
end)
