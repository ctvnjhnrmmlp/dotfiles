local wezterm = require("wezterm")

local config = wezterm.config_builder()

local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd)
	window:gui_window():toggle_fullscreen()
end)

config.color_scheme = "3024 (base16)"
config.window_decorations = "NONE"
config.enable_tab_bar = false
config.window_padding = {
	left = 0,
	right = 0,
	top = 10,
	bottom = 10,
}

config.font = wezterm.font("FiraCode Nerd Font", { weight = "Bold" })
config.font_size = 14.0

return config
