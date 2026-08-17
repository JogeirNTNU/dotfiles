-- =======================================================================================
-- CONF/SHORTCUTS.LUA
-- Keybindings and mouse bindings
-- =======================================================================================

-- ---- SYSTEM CONTROL ----
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + W", hl.dsp.window.close())
hl.bind(
	mainMod .. " + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit")
)
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("killall -SIGUSR1 waybar")) -- Show/hide waybar
hl.bind("Print", hl.dsp.exec_cmd("grimblast --freeze copy area")) -- Screenshot tool
hl.bind("SUPER + SHIFT + B", hl.dsp.exec_cmd("firefox"))

-- ---- TILING CONTROL (move windows) ----
hl.bind("SUPER + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind("SUPER + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind("SUPER + SHIFT + down", hl.dsp.window.move({ direction = "down" }))

-- ---- FOCUS CONTROL ----
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- ---- MOUSE CONTROL ON WINDOWS ----
-- Super + Left click  → move window freely
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
-- Super + Right click → resize window
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- ---- MOUSE THUMB BUTTONS → SPOTIFY ----
hl.bind("mouse:275", hl.dsp.exec_cmd("playerctl previous")) -- Back thumb button
hl.bind("mouse:276", hl.dsp.exec_cmd("playerctl next")) -- Forward thumb button

-- ---- MEDIA KEYS ----
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))

-- ---- VOLUME ----
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"))

-- ---- WORKSPACE SWITCHING (1-10) ----
for i = 1, 10 do
	local key = i % 10 -- workspace 10 maps to key "0"
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end
