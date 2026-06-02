-- disable redundant warnings from lua lsp for this specific file
---@diagnostic disable: undefined-global

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
-- TODO: test each of those
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})

-- Specify in which workspace to start some programs
hl.window_rule({
	match = {
		class = "^(google-chrome)$",
	},
	-- no_initial_focus = true,
	workspace = "1",
})

hl.window_rule({
	match = {
		class = "^(com.mitchellh.ghostty)$",
	},
	-- no_initial_focus = true,
	workspace = "2",
})

hl.window_rule({
	match = {
		class = "^(firefox)$",
	},
	-- no_initial_focus = true,
	workspace = "3",
})

hl.window_rule({
	match = {
		class = "^(Rocket.Chat|slack|discord|teams-for-linux)$",
	},
	-- no_initial_focus = true,
	workspace = "4",
})

hl.window_rule({
	match = {
		class = "^(zoom)$",
	},
	-- no_initial_focus = true,
	workspace = "5",
})

hl.window_rule({
	match = {
		class = "^(steam|lutris|heroic)$",
	},
	-- no_initial_focus = true,
	workspace = "6",
})
