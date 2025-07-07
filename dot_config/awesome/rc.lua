--[[

     Awesome WM configuration template
     https://github.com/awesomeWM

     Freedesktop : https://github.com/lcpz/awesome-freedesktop

     Copycats themes : https://github.com/lcpz/awesome-copycats

     lain : https://github.com/lcpz/lain

--]] --
-- Required libraries
local awesome, client, mouse, screen, tag = awesome, client, mouse, screen, tag
local ipairs, string, os, table, tostring, tonumber, type = ipairs, string, os, table, tostring, tonumber, type

-- https://awesomewm.org/doc/api/documentation/05-awesomerc.md.html
-- Standard awesome library
local gears = require("gears") -- Utilities such as color parsing and objects
local awful = require("awful") -- Everything related to window managment
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")

-- Theme handling library
local beautiful = require("beautiful")

-- Notification library
local naughty = require("naughty")
naughty.config.defaults["icon_size"] = 100

-- local menubar       = require("menubar")

local lain = require("lain")
local freedesktop = require("freedesktop")

-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
local hotkeys_popup = require("awful.hotkeys_popup").widget
require("awful.hotkeys_popup.keys")
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility
local dpi = require("beautiful.xresources").apply_dpi
-- }}

awful.spawn.with_shell("~/.config/awesome/setup-display.sh")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({
        preset = naughty.config.presets.critical,
        title = "Oops, there were errors during startup!",
        text = awesome.startup_errors
    })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function(err)
        if in_error then
            return
        end
        in_error = true

        naughty.notify({
            preset = naughty.config.presets.critical,
            title = "Oops, an error happened!",
            text = tostring(err)
        })
        in_error = false
    end)
end
-- }}}

-- notification setup
naughty.config.defaults.position = "top_right" -- default "top_right"
naughty.config.defaults.margin = dpi(5) -- default dpi(5)
naughty.config.defaults.screen = 1 -- default awful.screen.focused
naughty.config.defaults.timeout = 10 -- default 5
naughty.config.defaults.hover_timeout = 30 -- default 5
naughty.config.defaults.ontop = true -- default true
naughty.config.defaults.border_width = dpi(1) -- default dpi(1)

require("floating-titlebar")

-- {{{ Autostart windowless processes
local function run_once(cmd_arr)
    for _, cmd in ipairs(cmd_arr) do
        awful.spawn.with_shell(string.format("pgrep -u $USER -fx '%s' > /dev/null || (%s)", cmd, cmd))
    end
end

run_once({"unclutter -root"}) -- entries must be comma-separated
-- }}}

-- This function implements the XDG autostart specification
--[[
awful.spawn.with_shell(
    'if (xrdb -query | grep -q "^awesome\\.started:\\s*true$"); then exit; fi;' ..
    'xrdb -merge <<< "awesome.started:true";' ..
    -- list each of your autostart commands, followed by ; inside single quotes, followed by ..
    'dex --environment Awesome --autostart --search-paths "$XDG_CONFIG_DIRS/autostart:$XDG_CONFIG_HOME/autostart"' -- https://github.com/jceb/dex
)
--]]

-- }}}

-- {{{ Variable definitions

local themes = {
"multicolor", -- 1
"powerarrow", -- 2
"powerarrow-blue", -- 3
"blackburn", -- 4
"copland", -- 5
"powerarrow-dark" -- 6
}

-- choose your theme here
local chosen_theme = themes[1]

local theme_path = string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), chosen_theme)
beautiful.init(theme_path)

-- modkey or mod4 = super key
local modkey = "Mod4"
local altkey = "Mod1"
local ctrlkey = "Control"

-- awesome variables
awful.util.terminal = terminal
awful.layout.suit.tile.left.mirror = true
awful.layout.layouts = {
-- awful.layout.suit.tile,
-- awful.layout.suit.tile.left,
awful.layout.suit.tile.right, 
-- awful.layout.suit.tile.bottom,
-- awful.layout.suit.tile.top,
-- awful.layout.suit.spiral,
-- awful.layout.suit.spiral.dwindle,
awful.layout.suit.fair,
-- awful.layout.suit.fair.horizontal,
-- awful.layout.suit.magnifier,
awful.layout.suit.corner.nw,
-- awful.layout.suit.corner.ne
-- awful.layout.suit.corner.sw,
-- awful.layout.suit.corner.se,
-- lain.layout.cascade,
-- lain.layout.cascade.tile,
-- lain.layout.centerwork,
-- lain.layout.centerwork.horizontal,
-- lain.layout.termfair,
-- lain.layout.termfair.center,
awful.layout.suit.floating,
awful.layout.suit.max
-- awful.layout.suit.max.fullscreen,
}

require("tagnames")

awful.util.taglist_buttons = my_table.join(awful.button({}, 1, function(t)
    t:view_only()
end), awful.button({modkey}, 1, function(t)
    if client.focus then
        client.focus:move_to_tag(t)
    end
end), awful.button({}, 2, awful.tag.viewtoggle), awful.button({modkey}, 3, function(t)
    if client.focus then
        client.focus:toggle_tag(t)
    end
end), awful.button({}, 4, function(t)
    -- awful.tag.viewprev(t.screen)
    if t.screen.selected_tag.index > 1 then
        local prevtag = t.screen.selected_tag.index - 1
        t.screen.tags[prevtag]:view_only()
    end
end), awful.button({}, 5, function(t)
    -- awful.tag.viewnext(t.screen)
    if t.screen.selected_tag.index < #t.screen.tags then
        local nexttag = t.screen.selected_tag.index + 1
        t.screen.tags[nexttag]:view_only()
    end
end))

awful.util.tasklist_buttons = my_table.join(awful.button({}, 1, function(c)
    client.focus = c
    c:raise()
end), awful.button({}, 2, function(c)
    c:kill()
end), awful.button({}, 3, function(c)
    -- c.minimized = not c.minimized
    c.minimized = true
end), awful.button({}, 4, function(c)
    awful.client.focus.byidx(-1)
end), awful.button({}, 5, function()
    awful.client.focus.byidx(1)
end))

lain.layout.termfair.nmaster = 3
lain.layout.termfair.ncol = 1
lain.layout.termfair.center.nmaster = 3
lain.layout.termfair.center.ncol = 1
lain.layout.cascade.tile.offset_x = dpi(2)
lain.layout.cascade.tile.offset_y = dpi(32)
lain.layout.cascade.tile.extra_padding = dpi(5)
lain.layout.cascade.tile.nmaster = 5
lain.layout.cascade.tile.ncol = 2

beautiful.init(string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), chosen_theme))
-- }}}

-- {{{ Menu
local myawesomemenu = {{"hotkeys", function()
    return false, hotkeys_popup.show_help
end}, {"arandr", "arandr"}}

awful.util.mymainmenu = freedesktop.menu.build({
    before = {{"Awesome", myawesomemenu} -- { "Atom", "atom" },
    -- other triads can be put here
    },
    after = {{"Terminal", terminal}, {"Log out", function()
        awesome.quit()
    end}, {"Sleep", "systemctl suspend"}, {"Restart", "systemctl reboot"}, {"Shutdown", "systemctl poweroff"} -- other triads can be put here
    }
})
-- hide menu when mouse leaves it
-- awful.util.mymainmenu.wibox:connect_signal("mouse::leave", function() awful.util.mymainmenu:hide() end)

-- menubar.utils.terminal = terminal -- Set the Menubar terminal for applications that require it
-- }}}

-- {{{ Screen
-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", function(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end)

---- No borders when rearranging only 1 non-floating or maximized client (has client freezing bug)
-- screen.connect_signal("arrange", function (s)
-- local only_one = #s.tiled_clients == 1
-- for _, c in pairs(s.clients) do
-- if only_one and not c.floating or c.maximized or c.fullscreen then
-- c.border_width = 2
-- else
-- c.border_width = beautiful.border_width
-- end
-- end
-- end)
-- Create a wibox for each screen and add it
awful.screen.connect_for_each_screen(function(s)
    beautiful.at_screen_connect(s)
    s.systray = wibox.widget.systray()
    s.systray.visible = true
end)
-- }}}

-- {{{ Mouse bindings
root.buttons(my_table.join( -- awful.button({ }, 3, function () awful.util.mymainmenu:toggle() end)
-- awful.button({ }, 4, awful.tag.viewprev),
-- awful.button({ }, 5, awful.tag.viewnext)
))
-- }}}

-- {{{ Key bindings
require("shortcuts")

require("clientkeys")

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 10 do
    -- Hack to only show tags 1 and 9 in the shortcut window (mod+s)
    local descr_view, descr_toggle, descr_move, descr_toggle_focus
    if i == 1 or i == 10 then
        descr_view = {
            description = "view tag #",
            group = "tag"
        }
        descr_toggle = {
            description = "toggle tag #",
            group = "tag"
        }
        descr_move = {
            description = "move focused client to tag #",
            group = "tag"
        }
        descr_toggle_focus = {
            description = "toggle focused client on tag #",
            group = "tag"
        }
    end

    local actualkey
    if i == 6 then
        actualkey = "q"
    elseif i == 7 then
        actualkey = "w"
    elseif i == 8 then
        actualkey = "f"
    elseif i == 9 then
        actualkey = "p"
    elseif i == 10 then
        actualkey = "b"
    else
        actualkey = "#" .. i + 9
    end

    globalkeys = my_table.join(globalkeys, -- View tag only.
    awful.key({modkey}, actualkey, function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
            tag:view_only()
        end
    end, descr_view), -- Toggle tag display.
    awful.key({modkey, "Control"}, actualkey, function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
            awful.tag.viewtoggle(tag)
        end
    end, descr_toggle), -- Move client to tag.
    awful.key({modkey, "Shift"}, actualkey, function()
        if client.focus then
            local tag = client.focus.screen.tags[i]
            if tag then
                client.focus:move_to_tag(tag)
                tag:view_only()
            end
        end
    end, descr_move), -- Toggle tag on focused client.
    awful.key({modkey, "Control", "Shift"}, actualkey, function()
        if client.focus then
            local tag = client.focus.screen.tags[i]
            if tag then
                client.focus:toggle_tag(tag)
            end
        end
    end, descr_toggle_focus))
end

require("clientbuttons")

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
require("rules")
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    if not awesome.startup then
        awful.client.setslave(c)
    end

    if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- Custom
    if beautiful.titlebar_fun then
        beautiful.titlebar_fun(c)
        return
    end

    -- Default
    -- buttons for the titlebar
    local buttons = my_table.join(awful.button({}, 1, function()
        c:emit_signal("request::activate", "titlebar", {
            raise = true
        })
        awful.mouse.client.move(c)
    end), awful.button({}, 3, function()
        c:emit_signal("request::activate", "titlebar", {
            raise = true
        })
        awful.mouse.client.resize(c)
    end))

    awful.titlebar(c, {
        size = dpi(21)
    }):setup({
        { -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout = wibox.layout.fixed.horizontal
        },
        { -- Middle
            { -- Title
                align = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout = wibox.layout.flex.horizontal
        },
        { -- Right
            awful.titlebar.widget.floatingbutton(c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton(c),
            awful.titlebar.widget.ontopbutton(c),
            awful.titlebar.widget.closebutton(c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    })
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {
        raise = false
    })
end)

client.connect_signal("focus", function(c)
    c.border_color = beautiful.border_focus
end)
client.connect_signal("unfocus", function(c)
    c.border_color = beautiful.border_normal
end)

-- }}}

-- Autostart applications
awful.spawn.with_shell("~/.config/awesome/autostart.sh")
-- awful.spawn.with_shell("~/autostart.sh")
-- awful.spawn.with_shell("xcompmgr -c")
-- awful.spawn.with_shell("picom -b --config  $HOME/.config/awesome/picom.conf")
