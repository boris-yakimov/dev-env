-- disable redundant warnings from lua lsp for this specific file
---@diagnostic disable: undefined-global

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)

hl.on("hyprland.start", function()
	hl.exec_cmd("hyprlock") -- # hyprlock started as first program to prompt for standard hyprlock login
	hl.exec_cmd("waybar") -- OS status bar
	hl.exec_cmd(notifications) -- notifications pop-up deamon
	hl.exec_cmd("hypridle") -- system idle and lock screen
	hl.exec_cmd("openrgb --color ffffff") -- keyboard backlight to solid white
	hl.exec_cmd("hyprpaper") -- wallpapers
end)
