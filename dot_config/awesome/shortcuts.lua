local awful = require("awful") -- Everything related to window managment

local gears = require("gears") -- Utilities such as color parsing and objects
local lain = require("lain")
local beautiful = require("beautiful")
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

-- local pulse = require("pulseaudio_widget")
local hotkeys_popup = require("awful.hotkeys_popup").widget
require("awful.hotkeys_popup.keys")

-- modkey or mod4 = super key
local modkey = "Mod4"
local altkey = "Mod1"
local ctrlkey = "Control"
local shiftkey = "Shift"

globalkeys = my_table.join(
	-- {{{ Personal keybindings
	awful.key({ ctrlkey, altkey }, "o", function()
		awful.spawn.with_shell("$HOME/.config/awesome/scripts/picom-toggle.sh")
	end, {

		description = "Picom toggle",
		group = "ctrl+alt",
	}), -- Personal keybindings}}}
	-- Hotkeys Awesome
	awful.key({ altkey }, "x", function()
		awful.prompt.run({
			prompt = "Run Lua code: ",
			textbox = awful.screen.focused().mypromptbox.widget,
			exe_callback = awful.util.eval,
			history_path = awful.util.get_cache_dir() .. "/history_eval",
		})
	end, {
		description = "lua execute prompt",
		group = "awesome",
	}),
	awful.key({ modkey }, "d", hotkeys_popup.show_help, {
		description = "show help",
		group = "awesome",
	}),
	awful.key({ modkey, shiftkey }, "r", awesome.restart, {
		description = "reload awesome",
		group = "awesome",
	}), -- Tag browsing with modkey
	awful.key({ modkey }, "Left", awful.tag.viewprev, {
		description = "view previous",
		group = "tag",
	}),
	awful.key({ modkey }, "Right", awful.tag.viewnext, {
		description = "view next",
		group = "tag",
	}), -- Tag browsing alt + tab
	awful.key({ altkey }, "Tab", function()
		awful.client.focus.byidx(1)
	end, {
		description = "view next",
		group = "client",
	}),
	awful.key({ altkey, shiftkey }, "Tab", function()
		awful.client.focus.byidx(-1)
	end, {
		description = "view previous",
		group = "client",
	}), -- Tag browsing modkey + tab
	awful.key({ modkey }, "Tab", awful.tag.viewnext, {
		description = "view next",
		group = "tag",
	}),
	awful.key({ modkey, shiftkey }, "Tab", awful.tag.viewprev, {
		description = "view previous",
		group = "tag",
	}), -- Focus next screen
	awful.key({ modkey }, "`", function()
		awful.screen.focus_relative(1)
	end), -- Non-empty tag browsing
	-- awful.key({ modkey }, "Left", function () lain.util.tag_view_nonempty(-1) end,
	-- {description = "view  previous nonempty", group = "tag"}),
	-- awful.key({ modkey }, "Right", function () lain.util.tag_view_nonempty(1) end,
	-- {description = "view  next nonempty", group = "tag"}),
	-- By direction client focus
	awful.key({ modkey }, "e", function()
		awful.client.focus.global_bydirection("down")
		if client.focus then
			client.focus:raise()
		end
	end, {
		description = "focus down",
		group = "client",
	}),
	awful.key({ modkey }, "u", function()
		awful.client.focus.global_bydirection("up")
		if client.focus then
			client.focus:raise()
		end
	end, {
		description = "focus up",
		group = "client",
	}),
	awful.key({ modkey }, "n", function()
		awful.client.focus.global_bydirection("left")
		if client.focus then
			client.focus:raise()
		end
	end, {
		description = "focus left",
		group = "client",
	}),
	awful.key({ modkey }, "i", function()
		awful.client.focus.global_bydirection("right")
		if client.focus then
			client.focus:raise()
		end
	end, {
		description = "focus right",
		group = "client",
	}), -- By direction client focus with arrows
	awful.key({ modkey }, "Down", function()
		awful.client.focus.global_bydirection("down")
		if client.focus then
			client.focus:raise()
		end
	end, {
		description = "focus down",
		group = "client",
	}),
	awful.key({ modkey }, "Up", function()
		awful.client.focus.global_bydirection("up")
		if client.focus then
			client.focus:raise()
		end
	end, {
		description = "focus up",
		group = "client",
	}),
	awful.key({ modkey }, "Left", function()
		awful.client.focus.global_bydirection("left")
		if client.focus then
			client.focus:raise()
		end
	end, {
		description = "focus left",
		group = "client",
	}),
	awful.key({ modkey }, "Right", function()
		awful.client.focus.global_bydirection("right")
		if client.focus then
			client.focus:raise()
		end
	end, {
		description = "focus right",
		group = "client",
	}), -- Layout manipulation
	awful.key({ modkey, shiftkey }, "j", function()
		awful.client.swap.byidx(1)
	end, {
		description = "swap with next client by index",
		group = "client",
	}),
	awful.key({ modkey, shiftkey }, "k", function()
		awful.client.swap.byidx(-1)
	end, {
		description = "swap with previous client by index",
		group = "client",
	}),
	awful.key({ modkey, ctrlkey }, "j", function()
		awful.screen.focus_relative(1)
	end, {
		description = "focus the next screen",
		group = "screen",
	}),
	awful.key({ modkey, ctrlkey }, "k", function()
		awful.screen.focus_relative(-1)
	end, {
		description = "focus the previous screen",
		group = "screen",
	}),
	awful.key({ modkey }, "u", awful.client.urgent.jumpto, {
		description = "jump to urgent client",
		group = "client",
	}),
	awful.key({ ctrlkey }, "Tab", function()
		awful.client.focus.history.previous()
		if client.focus then
			client.focus:raise()
		end
	end, {
		description = "go back",
		group = "client",
	}),
	awful.key({ altkey, shiftkey }, "l", function()
		awful.tag.incmwfact(0.05)
	end, {
		description = "increase master width factor",
		group = "layout",
	}),
	awful.key({ altkey, shiftkey }, "h", function()
		awful.tag.incmwfact(-0.05)
	end, {
		description = "decrease master width factor",
		group = "layout",
	}),
	awful.key({ modkey, shiftkey }, "h", function()
		awful.tag.incnmaster(1, nil, true)
	end, {
		description = "increase the number of master clients",
		group = "layout",
	}),
	awful.key({ modkey, shiftkey }, "l", function()
		awful.tag.incnmaster(-1, nil, true)
	end, {
		description = "decrease the number of master clients",
		group = "layout",
	}),
	awful.key({ modkey, ctrlkey }, "h", function()
		awful.tag.incncol(1, nil, true)
	end, {
		description = "increase the number of columns",
		group = "layout",
	}),
	awful.key({ modkey, ctrlkey }, "l", function()
		awful.tag.incncol(-1, nil, true)
	end, {
		description = "decrease the number of columns",
		group = "layout",
	}),
	awful.key({ modkey }, "space", function()
		awful.layout.inc(1)
	end, {
		description = "select next",
		group = "layout",
	}),
	awful.key({ modkey, shiftkey }, "space", function()
		awful.layout.inc(-1)
	end, {
		description = "select previous",
		group = "layout",
	}),
	awful.key({ modkey, ctrlkey }, "n", function()
		local c = awful.client.restore()
		-- Focus restored client
		if c then
			client.focus = c
			c:raise()
		end
	end, {
		description = "restore minimized",
		group = "client",
	}), -- Widgets popups
	-- awful.key({ altkey, }, "c", function () lain.widget.calendar.show(7) end,
	-- {description = "show calendar", group = "widgets"}),
	-- awful.key({ altkey, }, "h", function () if beautiful.fs then beautiful.fs.show(7) end end,
	-- {description = "show filesystem", group = "widgets"}),
	-- awful.key({ altkey, }, "w", function () if beautiful.weather then beautiful.weather.show(7) end end,
	-- {description = "show weather", group = "widgets"}),
	-- Brightness
	awful.key({}, "XF86MonBrightnessUp", function()
		os.execute("light -A 2")
	end, {
		description = "+2%",
		group = "hotkeys",
	}),
	awful.key({}, "XF86MonBrightnessDown", function()
		os.execute("light -U 2")
	end, {
		description = "-2%",
		group = "hotkeys",
	}), -- ALSA volume control
	-- awful.key({ ctrlkey }, "Up",
	awful.key({}, "XF86AudioRaiseVolume", function()
		os.execute(string.format("amixer -q set %s 5%%+", beautiful.volume.channel))
		beautiful.volume.update()
		awful.spawn.easy_async_with_shell("showsoundlevel")
	end), -- awful.key({ ctrlkey }, "Down",
	awful.key({}, "XF86AudioLowerVolume", function()
		os.execute(string.format("amixer -q set %s 5%%-", beautiful.volume.channel))
		beautiful.volume.update()
		awful.spawn.easy_async_with_shell("showsoundlevel")
	end),
	awful.key({}, "XF86AudioMute", function()
		os.execute(string.format("amixer -q set %s toggle", beautiful.volume.togglechannel or beautiful.volume.channel))
		beautiful.volume.update()
	end), -- Media keys supported by vlc, spotify, audacious, xmm2, ...
	awful.key({}, "XF86AudioPlay", function()
		awful.util.spawn("playerctl play-pause", false)
	end),
	awful.key({}, "XF86AudioNext", function()
		awful.util.spawn("playerctl next", false)
	end),
	awful.key({}, "XF86AudioPrev", function()
		awful.util.spawn("playerctl previous", false)
	end),
	awful.key({}, "XF86AudioStop", function()
		awful.util.spawn("playerctl stop", false)
	end), -- Media keys supported by mpd.
	-- awful.key({}, "XF86AudioPlay", function () awful.util.spawn("mpc toggle") end),
	-- awful.key({}, "XF86AudioNext", function () awful.util.spawn("mpc next") end),
	-- awful.key({}, "XF86AudioPrev", function () awful.util.spawn("mpc prev") end),
	-- awful.key({}, "XF86AudioStop", function () awful.util.spawn("mpc stop") end),
	-- MPD control
	awful.key({ ctrlkey, shiftkey }, "Up", function()
		os.execute("mpc toggle")
		beautiful.mpd.update()
	end, {
		description = "mpc toggle",
		group = "widgets",
	}),
	awful.key({ ctrlkey, shiftkey }, "Down", function()
		os.execute("mpc stop")
		beautiful.mpd.update()
	end, {
		description = "mpc stop",
		group = "widgets",
	}),
	awful.key({ ctrlkey, shiftkey }, "Left", function()
		os.execute("mpc prev")
		beautiful.mpd.update()
	end, {
		description = "mpc prev",
		group = "widgets",
	}),
	awful.key({ ctrlkey, shiftkey }, "Right", function()
		os.execute("mpc next")
		beautiful.mpd.update()
	end, {
		description = "mpc next",
		group = "widgets",
	}),
	awful.key({ ctrlkey, shiftkey }, "s", function()
		local common = {
			text = "MPD widget ",
			position = "top_middle",
			timeout = 2,
		}
		if beautiful.mpd.timer.started then
			beautiful.mpd.timer:stop()
			common.text = common.text .. lain.util.markup.bold("OFF")
		else
			beautiful.mpd.timer:start()
			common.text = common.text .. lain.util.markup.bold("ON")
		end
		naughty.notify(common)
	end, {
		description = "mpc on/off",
		group = "widgets",
	})
)
