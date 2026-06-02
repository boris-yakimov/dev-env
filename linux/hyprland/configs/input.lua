-- disable redundant warnings from lua lsp for this specific file
---@diagnostic disable: undefined-global

hl.config({
	input = {
		kb_layout = "us, bg",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		follow_mouse = 1,

		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			natural_scroll = false,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
-- TODO: should this be updated, it used to be the same in the old config as well ?
hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})

hl.config({
	cursor = {
		inactive_timeout = 2, -- hide the cursor when using keyboard or while idle
	},
})
