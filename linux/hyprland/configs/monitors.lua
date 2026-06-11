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
-- TODO: test with personal laptop

-- main PC - на Село
hl.monitor({
	output = "desc:Dell Inc. DELL S2721DGF 1RXZY13", -- main monitor на Село
	mode = "2560x1440@59",
	position = "auto",
	scale = "1",
})

hl.monitor({
	output = "desc:BNQ BenQ LCD A9J00468019", -- second monitor на Село
	mode = "2560x1440@59",
	position = "0x0",
	scale = "1",
})

-- work Laptop
hl.monitor({
	output = "desc:Dell Inc. DELL S2721D 4X0GP43", -- main monitor at work
	mode = "2560x1440@59",
	position = "1600x0", -- 1600 here because the laptop monitor has a native resolution of 1920x1200 with a 1.2 scale factor, resulting in a logical (effective) resolution of 1600x1000 (1920/1.2=1600)
	scale = "1",
})

hl.monitor({
	output = "desc:BOE 0x0A31", -- work laptop monitor
	mode = "1920x1200@60",
	position = "0x0",
	scale = "1.20",
})
