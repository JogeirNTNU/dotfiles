-- =======================================================================================
-- Monitor configuration
-- =======================================================================================

-- Small screen (HDMI-A-1)
hl.monitor({
	output = "HDMI-A-1",
	mode = "1920x1080@60",
	position = "0x730",
	scale = 1,
})

-- Main screen 2560x1440 240Hz with HDR (DP-3)
hl.monitor({
	output = "DP-3",
	mode = "2560x1440@240",
	position = "1920x560",
	scale = 1,
	bitdepth = 10,
	cm = "srgb",
})

-- Vertical screen (DP-2), rotated 270° (transform 3)
hl.monitor({
	output = "DP-2",
	mode = "2560x1440@165",
	position = "4480x0",
	scale = 1,
	transform = 3, -- 3 = 270° (WL_OUTPUT_TRANSFORM_270)
})

-- Enable variable refresh rate: 0 = off, 1 = always, 2 = fullscreen only
hl.config({
	misc = {
		vrr = 2,
	},
})

--Steam popups position fix
-- hl.window_rule({
-- 	name = "steam-notification-toast",
-- 	match = { class = "steam", title = "notificationtoasts_.*_desktop" },
-- 	float = true,
-- 	pin = true,
-- 	stayfocused = true,
-- 	move = "100%-420 100%-250",
-- 	size = "380 100",
-- 	no_border = true,
-- })
