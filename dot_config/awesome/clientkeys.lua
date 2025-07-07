local awful = require("awful")
local gears = require("gears")
local lain = require("lain")

local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local modkey = "Mod4"
local ctrlkey = "Control"
local shiftkey = "Shift"

clientkeys = my_table.join(
	awful.key({ modkey, ctrlkey }, "Return", function(c)
		c:swap(awful.client.getmaster())
	end, {
		description = "move to master",
		group = "client",
	}),
	awful.key({ modkey }, "Escape", function(c)
		c:kill()
	end, {
		description = "close window",
		group = "hotkeys",
	}),
	awful.key({ modkey, shiftkey }, "`", function(c)
		c:move_to_screen()
		if c.floating then
			awful.placement.centered(c, nil)
		end
	end, {
		description = "move to other screen",
		group = "client",
	}),
	awful.key({ modkey, shiftkey }, "g", function(c)
		c.fullscreen = not c.fullscreen
		c:raise()
	end, {
		description = "toggle fullscreen",
		group = "client",
	}),
	awful.key({ modkey }, "t", awful.client.floating.toggle, {
		description = "toggle floating",
		group = "client",
	}),
	awful.key({ modkey, shiftkey }, "t", function(c)
		c.ontop = not c.ontop
	end, {
		description = "toggle keep on top",
		group = "client",
	}),
	awful.key({ modkey }, "g", function(c)
		if c.maximized_vertical then
			c.maximized_vertical = not c.maximized_vertical
		end
		if c.maximized_horizontal then
			c.maximized_horizontal = not c.maximized_horizontal
		end
		c.maximized = not c.maximized
		c:raise()
	end, {
		description = "maximize",
		group = "client",
	}),
	awful.key({ modkey }, "v", function(c)
		c.maximized_vertical = not c.maximized_vertical
		c:raise()
	end, {
		description = "maximize vertically",
		group = "client",
	})
)
