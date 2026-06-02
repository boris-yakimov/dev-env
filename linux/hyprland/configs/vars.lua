-- disable redundant warnings from lua lsp for this specific file
---@diagnostic disable: lowercase-global
---@diagnostic disable: undefined-global

terminal = "ghostty"
fileManager = "dolphin"
menu = "~/.config/wofi/wofi-menu.sh" -- TODO: test switching to hyprlauncher
notifications = "swaync"

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- qt configuration for Dolpin theme
hl.env("QT_STYLE_OVERRIDE", "kvantum")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
