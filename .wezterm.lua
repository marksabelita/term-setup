local wezterm = require("wezterm")
-- Pull in the wezterm API

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action
-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = "Dracula (Official)"
-- config.color_scheme = 'Belafonte Day'
-- config.color_scheme = "Dark Ocean (terminal.sexy)"

config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.font_dirs = { "~/Library/Fonts" }
config.freetype_load_target = "HorizontalLcd"
config.font_size = 15
config.line_height = 1

-- DARK THEME
config.color_scheme = "Abernathy"
-- config.font = wezterm.font("SauceCodePro Nerd Font", { stretch = "Normal", weight = "DemiBold" })
config.font = wezterm.font("JetBrains Mono", { stretch = "Normal", weight = "DemiBold" })

-- JetBrains Mono
--
-- LIGHT THEME
-- config.color_scheme = "Catppuccin Latte"
-- -- config.font = wezterm.font("SauceCodePro Nerd Font", { stretch = "Normal", weight = "Bold" })
-- config.font = wezterm.font("JetBrains Mono", { stretch = "Normal", weight = "Bold" })

config.window_background_opacity = 0.90
config.initial_rows = 65
config.initial_cols = 150
config.cell_width = 1
config.audible_bell = "Disabled"
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"

config.macos_window_background_blur = 5
config.keys = {
	{
		key = "e",
		mods = "CMD",
		action = act.PaneSelect({
			alphabet = "asdf",
		}),
	},
	-- {
	-- 	key = "l",
	-- 	mods = "CMD",
	-- 	action = function()
	-- 		config.color_scheme = "Catppuccin Latte"
	-- 		config.font = wezterm.font("SauceCodePro Nerd Font", { stretch = "Normal", weight = "Bold" })
	-- 	end,
	-- },
	{
		key = "d",
		mods = "CMD",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "p",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
		mods = "CMD",
	},
}
local mux = wezterm.mux

wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

return config
