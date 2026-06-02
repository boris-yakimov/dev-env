-- disable redundant warnings from lua lsp for this specific file
---@diagnostic disable: undefined-global

-- https://wiki.hypr.land/Configuring/Basics/Monitors/
-- default setup to catch any display not specified bellow
hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "auto",
})

-- TODO: add the correct config for main monitor at home
-- main PC - 4k / 32 inch
-- hl.monitor({
-- 	output = "DP-1",
-- 	mode = "preferred",
-- 	position = "auto",
-- 	scale = "1.5",
-- })
--
-- TODO: test with the desktop PC на село
-- TODO: test with personal laptop

-- work Laptop
hl.monitor({
	output = "desc:Dell Inc. DELL S2721D 4X0GP43", -- main monitor at work
	mode = "2560x1440@59",
	position = "1536x0", -- 1536 here because main laptop monitor is used at 1920x1200 with a 1.25 scaling which makes the main monitor sit exactly to the right of the laptop monitor (1920/1.25=1536px)
	scale = "1",
})

hl.monitor({
	output = "desc:BOE 0x0A31", -- work laptop monitor
	mode = "1920x1200@60",
	position = "0x0",
	scale = "1.25",
})
