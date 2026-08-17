-- =======================================================================================
-- HYPRLAND.LUA
-- =======================================================================================

-- ---- MY PROGRAMS ----
local mainMod = "SUPER"
local terminal = "kitty"
local fileManager = "thunar"
local menu = "rofi -show run"

-- Export these as globals so sourced files can access them
_G.mainMod = mainMod
_G.terminal = terminal
_G.fileManager = fileManager
_G.menu = menu

-- ---- SOURCE SUB-CONFIGS ----

require("conf/screen")
require("conf/shortcuts")
require("conf/popupfix")

-- ---- AUTOSTART ----
hl.on("hyprland.start", function()
	-- Propagate Wayland env to systemd/dbus
	hl.dispatch(hl.dsp.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"))

	hl.dispatch(hl.dsp.exec_cmd("~/.config/hypr/conf/blue_yeti_fix.sh"))
	hl.dispatch(hl.dsp.exec_cmd("waybar"))
	hl.dispatch(hl.dsp.exec_cmd("hyprpaper")) -- remove if using animated/moving wallpapers
	hl.dispatch(hl.dsp.exec_cmd("steam"))
	hl.dispatch(hl.dsp.exec_cmd("vesktop"))
	hl.dispatch(hl.dsp.exec_cmd("~/.config/hypr/scripts/fix-dp1.sh"))
end)

-- ---- WINDOW RULES (launch apps on specific workspaces) ----
hl.window_rule({
	name = "windowrule-1",
	match = { class = "^(Vesktop)" },
})

hl.window_rule({
	name = "windowrule-2",
	match = { class = "^(steam)" },
})

-- ---- INPUT ----
hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "altgr-intl",
	},
	render = {
		cm_auto_hdr = true,
	},
})

-- ---- CURSOR ----
hl.config({
	cursor = {
		-- Disable hardware cursors to prevent mouse movement from triggering HDR brightness shifts
		no_hardware_cursors = true,
	},
})

-- FastFetch --
hl.bind("SUPER + F1", hl.dsp.exec_cmd("kitty --hold -e fastfetch"))

-- ---- Drivers ----
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("GBM_BACKEND", "nvidia-drm")

-- ---- ANIMATIONS ----
hl.config({
	animations = { enabled = true },
})

-- Custom bezier curves (was: bezier = name, p1x, p1y, p2x, p2y)
hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.curve("fastBezier", { type = "bezier", points = { { 0.1, 1.0 }, { 0.1, 1.0 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 1, bezier = "fastBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, bezier = "fastBezier" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 3, bezier = "fastBezier" })
hl.animation({ leaf = "border", enabled = true, speed = 4, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 4, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3, bezier = "myBezier" })
