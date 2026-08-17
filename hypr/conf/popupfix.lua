-- ---- GLOBAL FIX FOR EMPTY-TITLE POPUPS (dropdowns, toasts, tooltips) ----
-- Catches any app's transient unmanaged windows that flash and vanish,
-- not just Steam's.
hl.window_rule({
	name = "empty-title-popups-float",
	match = { title = "^$" },
	float = true,
	no_anim = true,
	no_focus = true,
})

-- ---- STEAM POPUP/DROPDOWN FIX ----
-- Steam's dropdown menus and friend-activity popups are unmanaged windows
-- with an empty title. Hyprland's default focus/animation handling causes
-- them to flash for one frame and immediately close. Pinning them to the
-- same monitor as the main Steam window (HDMI-A-1) stops them from
-- spawning misplaced on DP-1 or DP-2.
hl.window_rule({
	name = "steam-main-noanim",
	match = { class = "^(steam)$" },
	no_shadow = true,
})
