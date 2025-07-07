local awful = require("awful")

new_tags = {
	screens = {
		{
			default_layout = awful.layout.layouts[1],
			tags = {
				{
					"",
					awful.layout.suit.tile.right,
				},
				{
					"",
					awful.layout.suit.tile.right,
				},
				{
					"",
					awful.layout.suit.tile.right,
				},
				{
					"",
					awful.layout.suit.tile.right,
				},
				{
					"",
					awful.layout.suit.max,
				},
			},
		},
		{
			default_layout = awful.layout.layouts[1],
			tags = {
				{
					"",
					awful.layout.suit.max,
				},
				{
					"",
					awful.layout.suit.max,
				},
				{
					"",
					awful.layout.suit.max,
				},
				{
					"",
					awful.layout.suit.max,
				},
				{
					"",
					awful.layout.suit.max,
				},
			},
		},
	},
}
