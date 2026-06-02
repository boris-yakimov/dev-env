-- disable redundant warnings from lua lsp for this specific file
---@diagnostic disable: undefined-global

-- https://wiki.hypr.land/Configuring/Basics/Monitors/
-- default setup
-- hl.monitor({
-- 	output = "",
-- 	mode = "preferred",
-- 	position = "auto",
-- 	scale = "auto",
-- })

-- TODO: check if we can somehow alias primary and secondary monitors so that when I send a program to primary on any device it goes there

-- main PC - 4k / 32 inch
-- hl.monitor({
-- 	output = "DP-1",
-- 	mode = "preferred",
-- 	position = "auto",
-- 	scale = "1.5",
-- })

-- work Laptop
hl.monitor({
	output = "HDMI-A-1", -- main monitor
	mode = "2560x1440@59",
	position = "1280x0",
	scale = "1.07",
})

hl.monitor({
	output = "eDP-1", -- laptop monitor
	mode = "1920x1200@60",
	position = "0x0",
	scale = "1.50",
})
