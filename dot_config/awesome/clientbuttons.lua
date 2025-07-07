local gears = require("gears") -- Utilities such as color parsing and objects
local awful = require("awful") -- Everything related to window managment

local modkey = "Mod4"

clientbuttons = gears.table.join(
	awful.button({}, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", {
			raise = true,
		})
	end),
	awful.button({ modkey }, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", {
			raise = true,
		})
		awful.mouse.client.move(c)
	end),
	awful.button({ modkey }, 3, function(c)
		c:emit_signal("request::activate", "mouse_click", {
			raise = true,
		})
		awful.mouse.client.resize(c)
	end)
)
