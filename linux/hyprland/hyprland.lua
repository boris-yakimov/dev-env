-- disable redundant warnings from lua lsp for this specific file
---@diagnostic disable: undefined-global

require("configs.vars")
require("configs.autostart")
require("configs.monitors")
require("configs.keybinds")
-- require("configs.permissions")
require("configs.input")
require("configs.visuals")
require("configs.workspaces")

hl.config({
	--  https://wiki.hypr.land/Configuring/Variables/#misc
	misc = {
		force_default_wallpaper = -1, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = false, -- If true disables the random hyprland logo / anime girl background. :(
		disable_splash_rendering = true, -- if true disables the splash text rendered on top of the wall paper
	},
})
