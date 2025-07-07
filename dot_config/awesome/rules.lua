local awful = require("awful") -- Everything related to window managment
local beautiful = require("beautiful")

require("tagnames")
require("clientkeys")
require("clientbuttons")

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
	{ -- All clients will match this rule.
		rule = {},
		properties = {
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
			focus = awful.client.focus.filter,
			raise = true,
			keys = clientkeys,
			buttons = clientbuttons,
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap + awful.placement.no_offscreen,
			size_hints_honor = false,
		},
	},
	{
		rule = {
			role = "_NET_WM_STATE_FULLSCREEN",
		},
		properties = {
			floating = true,
		},
	},
	-- {
		-- rule = {
			-- class = "tutanota-desktop",
		-- },
		-- properties = {
			-- screen = 2,
			-- tag = "",
			-- switchtotag = false,
		-- },
	-- },
	-- {
		-- rule = {
			-- class = "easyeffects",
		-- },
		-- properties = {
			-- screen = 1,
			-- tag = "",
			-- switchtotag = false,
		-- },
	-- },
	-- {
		-- rule = {
			-- class = "discord",
		-- },
		-- properties = {
			-- screen = 1,
			-- tag = "",
			-- switchtotag = false,
		-- },
	-- },
	-- {
		-- rule = {
			-- class = "lutris",
			-- "Lutris",
			-- name = "Lutris",
		-- },
		-- properties = {
			-- screen = 1,
			-- tag = "",
			-- switchtotag = false,
		-- },
	-- },
	-- {
		-- rule = {
			-- class = "Steam",
		-- },
		-- properties = {
			-- screen = 1,
			-- tag = "",
			-- switchtotag = false,
		-- },
	-- },
	-- {
		-- rule = {
			-- class = "KeePassXC",
		-- },
		-- properties = {
			-- screen = 2,
			-- tag = "",
			-- switchtotag = false,
		-- },
	-- },
	-- {
		-- rule = {
			-- class = "Gittyup",
		-- },
		-- properties = {
			-- screen = 2,
			-- tag = "",
			-- switchtotag = false,
		-- },
	-- },
	{
		rule_any = {
			instance = {
				"DTA", -- Firefox addon DownThemAll.
				"copyq", -- Includes session name in class.
			},
			class = {
				"Arandr",
				"Blueberry",
				"Galculator",
				"Gnome-font-viewer",
				"Gpick",
				"Imagewriter",
				"Android Emulator",
				"Emulator",
				"Font-manager",
				"Kruler",
				"MessageWin", -- kalarm.
				"arcolinux-logout",
				"Peek",
				"Skype",
				"System-config-printer.py",
				"Sxiv",
				"Unetbootin.elf",
				"Wpa_gui",
				"pinentry",
				"veromix",
				"xdman",
				"xdm-app",
				"Xdm-app",
				"xtightvncviewer",
				"Polkit-gnome-authentication-agent-1",
				"Arcolinux-calamares-tool.py",
			},
			name = {
				"Event Tester", -- xev.
				"Friends List", -- steam
				"Emulator",
				"Android Emulator",
				"Steam - News",
			},
			role = {
				"AlarmWindow", -- Thunderbird's calendar.
				"pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
				"Preferences",
				"setup",
			},
			type = {
				"dialog",
			},
		},
		properties = {
			floating = true,
		},
		callback = function(c)
			awful.placement.centered(c, nil)
		end,
	},
}
