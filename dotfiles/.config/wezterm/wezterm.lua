local wezterm = require("wezterm")
local config = wezterm.config_builder()
local action = wezterm.action

config.font = wezterm.font_with_fallback({
	"Monaco",
	"Menlo",
	"Apple Color Emoji",
}, { weight = "Regular" })
-- change DPI for additional screens so fonts can look a little bit better
config.dpi_by_screen = { ["DELL C2422HE"] = 74, ["24G1WG4"] = 74 }
config.font_size = 13.0
config.enable_tab_bar = false
-- different hinting algorithm makes font looks a bit better
config.freetype_load_target = "Light"
config.window_background_opacity = 0.98
config.macos_window_background_blur = 20
config.window_decorations = "RESIZE" -- disable title bar
config.keys = {
	{ key = "p", mods = "CMD|SHIFT", action = action.ActivateCommandPalette },
}

config.color_scheme = "Catppuccin Mocha"
config.window_close_confirmation = "NeverPrompt"

return config
