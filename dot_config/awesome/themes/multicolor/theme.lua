--[[

     Multicolor Awesome WM theme 2.0
     github.com/lcpz

--]] local gears = require("gears")
local lain = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi = require("beautiful.xresources").apply_dpi

local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme = {}
theme.confdir = os.getenv("HOME") .. "/.config/awesome/themes/multicolor"
theme.wallpaper = theme.confdir .. "/wallpaper.png"
-- theme.wallpaper                                 = "/usr/share/backgrounds/arcolinux/arco-wallpaper.jpg"
theme.font = "Noto Sans Regular 11"
theme.taglist_font = "Noto Sans Regular 13"
theme.menu_bg_normal = "#000000"
theme.menu_bg_focus = "#000000"
theme.bg_normal = "#000000"
theme.bg_focus = "#000000"
theme.bg_urgent = "#000000"
theme.fg_normal = "#aaaaaa"
theme.fg_focus = "#ff8c00"
theme.fg_urgent = "#af1d18"
theme.fg_minimize = "#ffffff"
theme.border_width = dpi(2)
theme.border_normal = "#1c2022"
theme.border_focus = "#5e81ac"
theme.border_marked = "#3ca4d8"
theme.menu_border_width = 0
theme.menu_height = dpi(25)
theme.menu_width = dpi(260)
theme.menu_submenu_icon = theme.confdir .. "/icons/submenu.png"
theme.menu_fg_normal = "#aaaaaa"
theme.menu_fg_focus = "#ff8c00"
theme.menu_bg_normal = "#050505dd"
theme.menu_bg_focus = "#050505dd"
theme.vol = theme.confdir .. "/icons/vol.png"
theme.vol_low = theme.confdir .. "/icons/vol_low.png"
theme.vol_no = theme.confdir .. "/icons/vol_no.png"
theme.vol_mute = theme.confdir .. "/icons/vol_mute.png"
theme.widget_temp = theme.confdir .. "/icons/temp.png"
theme.widget_uptime = theme.confdir .. "/icons/ac.png"
theme.widget_cpu = theme.confdir .. "/icons/cpu.png"
theme.widget_weather = theme.confdir .. "/icons/dish.png"
theme.widget_fs = theme.confdir .. "/icons/fs.png"
theme.widget_mem = theme.confdir .. "/icons/mem.png"
theme.widget_netdown = theme.confdir .. "/icons/net_down.png"
theme.widget_netup = theme.confdir .. "/icons/net_up.png"
theme.widget_mail = theme.confdir .. "/icons/mail.png"
theme.widget_batt = theme.confdir .. "/icons/bat.png"
theme.widget_clock = theme.confdir .. "/icons/clock.png"
theme.widget_music = theme.confdir .. "/icons/note.png"
theme.widget_music_on = theme.confdir .. "/icons/note.png"
theme.widget_music_pause = theme.confdir .. "/icons/pause.png"
theme.widget_music_stop = theme.confdir .. "/icons/stop.png"
theme.taglist_squares_sel = theme.confdir .. "/icons/square_a.png"
theme.taglist_squares_unsel = theme.confdir .. "/icons/square_b.png"
theme.tasklist_plain_task_name = false
theme.tasklist_disable_icon = false
theme.tasklist_fg_normal = "#ffffff"
theme.tasklist_fg_focus = "#ffffff"
theme.tasklist_bg_focus = "#384D67"
theme.tasklist_fg_minimize = "#999999"
theme.useless_gap = 4
theme.layout_tile = theme.confdir .. "/icons/tile.png"
theme.layout_tilegaps = theme.confdir .. "/icons/tilegaps.png"
theme.layout_tileleft = theme.confdir .. "/icons/tileleft.png"
theme.layout_tilebottom = theme.confdir .. "/icons/tilebottom.png"
theme.layout_tiletop = theme.confdir .. "/icons/tiletop.png"
theme.layout_fairv = theme.confdir .. "/icons/fairv.png"
theme.layout_fairh = theme.confdir .. "/icons/fairh.png"
theme.layout_spiral = theme.confdir .. "/icons/spiral.png"
theme.layout_dwindle = theme.confdir .. "/icons/dwindle.png"
theme.layout_max = theme.confdir .. "/icons/max.png"
theme.layout_fullscreen = theme.confdir .. "/icons/fullscreen.png"
theme.layout_magnifier = theme.confdir .. "/icons/magnifier.png"
theme.layout_floating = theme.confdir .. "/icons/floating.png"
theme.titlebar_close_button_normal = theme.confdir .. "/icons/titlebar/close_normal.png"
theme.titlebar_close_button_focus = theme.confdir .. "/icons/titlebar/close_focus.png"
theme.titlebar_minimize_button_normal = theme.confdir .. "/icons/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus = theme.confdir .. "/icons/titlebar/minimize_focus.png"
theme.titlebar_ontop_button_normal_inactive = theme.confdir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive = theme.confdir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = theme.confdir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active = theme.confdir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_sticky_button_normal_inactive = theme.confdir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive = theme.confdir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = theme.confdir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active = theme.confdir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_floating_button_normal_inactive = theme.confdir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive = theme.confdir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = theme.confdir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active = theme.confdir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_maximized_button_normal_inactive = theme.confdir .. "/icons/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive = theme.confdir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = theme.confdir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active = theme.confdir .. "/icons/titlebar/maximized_focus_active.png"

local markup = lain.util.markup

local keyboardlayout = awful.widget.keyboardlayout:new()

-- Separators
local first = wibox.widget.textbox(markup.font("Terminus 3", " "))
local spr = wibox.widget.textbox(' ')
local small_spr = wibox.widget.textbox(markup.font("Terminus 4", " "))
local bar_spr = wibox.widget.textbox(markup.font("Terminus 3", " ") .. markup.fontfg(theme.font, "#777777", "|") .. markup.font("Terminus 5", " "))

-- Textclock
os.setlocale(os.getenv("LANG")) -- to localize the clock
local clockicon = wibox.widget.imagebox(theme.widget_clock)
local mytextclock = wibox.widget.textclock(markup("#7788af", "%A %d %B ") .. markup("#535f7a", ">") .. markup("#de5e1e", " %H:%M:%S "), 1)
mytextclock.font = theme.font

-- Calendar
theme.cal = lain.widget.cal(
    {
        attach_to = { mytextclock },
        notification_preset = {
            font = "Noto Sans Mono Medium 10",
            fg = theme.fg_normal,
            bg = theme.bg_normal
         }
    }
)

-- Weather
local weathericon = wibox.widget.imagebox(theme.widget_weather)
theme.weather = lain.widget.weather(
    {
        city_id = 2803138, -- placeholder (Belgium)
        notification_preset = {
            font = "Noto Sans Mono Medium 10",
            fg = theme.fg_normal
         },
        weather_na_markup = markup.fontfg(theme.font, "#eca4c4", "N/A "),
        settings = function()
            descr = weather_now["weather"][1]["description"]:lower()
            units = math.floor(weather_now["main"]["temp"])
            widget:set_markup(markup.fontfg(theme.font, "#eca4c4", descr .. " @ " .. units .. "°C "))
        end
    }
)

-- / fs
--[[ commented because it needs Gio/Glib >= 2.54
local fsicon = wibox.widget.imagebox(theme.widget_fs)
theme.fs = lain.widget.fs({
    notification_preset = { font = "Noto Sans Mono Medium 10", fg = theme.fg_normal },
    settings  = function()
        widget:set_markup(markup.fontfg(theme.font, "#80d9d8", string.format("%.1f", fs_now["/"].used) .. "% "))
    end
})
--]]

-- Mail IMAP check
--[[ commented because it needs to be set before use
local mailicon = wibox.widget.imagebox()
theme.mail = lain.widget.imap({
    timeout  = 180,
    server   = "server",
    mail     = "mail",
    password = "keyring get mail",
    settings = function()
        if mailcount > 0 then
            mailicon:set_image(theme.widget_mail)
            widget:set_markup(markup.fontfg(theme.font, "#cccccc", mailcount .. " "))
        else
            widget:set_text("")
            --mailicon:set_image() -- not working in 4.0
            mailicon._private.image = nil
            mailicon:emit_signal("widget::redraw_needed")
            mailicon:emit_signal("widget::layout_changed")
        end
    end
})
--]]

-- CPU
local cpuicon = wibox.widget.imagebox(theme.widget_cpu)
local cpu = lain.widget.cpu(
    {
        settings = function()
            widget:set_markup(markup.fontfg(theme.font, "#e33a6e", cpu_now.usage .. "% "))
        end
    }
)

-- Coretemp
local tempicon = wibox.widget.imagebox(theme.widget_temp)
local temp = lain.widget.temp(
    {
        settings = function()
            widget:set_markup(markup.fontfg(theme.font, "#f1af5f", coretemp_now .. "°C "))
        end
    }
)

-- Battery
local baticon = wibox.widget.imagebox(theme.widget_batt)
local bat = lain.widget.bat(
    {
        settings = function()
            local perc = bat_now.perc ~= "N/A" and bat_now.perc .. "%" or bat_now.perc

            if bat_now.ac_status == 1 then
                perc = perc .. " plug"
            end

            widget:set_markup(markup.fontfg(theme.font, theme.fg_normal, perc .. " "))
        end
    }
)

-- ALSA volume bar
local volicon = wibox.widget.imagebox(theme.vol)
theme.volume = lain.widget.alsabar {
    width = dpi(59),
    border_width = 0,
    ticks = true,
    ticks_size = dpi(6),
    notification_preset = {
        font = theme.font
     },
    -- togglechannel = "IEC958,3",
    settings = function()
        if volume_now.status == "off" then
            volicon:set_image(theme.vol_mute)
        elseif volume_now.level == 0 then
            volicon:set_image(theme.vol_no)
        elseif volume_now.level <= 50 then
            volicon:set_image(theme.vol_low)
        else
            volicon:set_image(theme.vol)
        end
    end,
    colors = {
        background = theme.bg_normal,
        mute = red,
        unmute = theme.fg_normal
     }
}
theme.volume.tooltip.wibox.fg = theme.fg_focus
theme.volume.bar:buttons(
    my_table.join(
        awful.button(
            {}, 1, function()
                awful.spawn(string.format("%s -e alsamixer", awful.util.terminal))
            end
        ), awful.button(
            {}, 2, function()
                os.execute(string.format("%s set %s 100%%", theme.volume.cmd, theme.volume.channel))
                theme.volume.update()
            end
        ), awful.button(
            {}, 3, function()
                os.execute(string.format("%s set %s toggle", theme.volume.cmd, theme.volume.togglechannel or theme.volume.channel))
                theme.volume.update()
            end
        ), awful.button(
            {}, 4, function()
                os.execute(string.format("%s set %s 1%%+", theme.volume.cmd, theme.volume.channel))
                theme.volume.update()
            end
        ), awful.button(
            {}, 5, function()
                os.execute(string.format("%s set %s 1%%-", theme.volume.cmd, theme.volume.channel))
                theme.volume.update()
            end
        )
    )
)
local volumebg = wibox.container.background(theme.volume.bar, "#474747", gears.shape.rectangle)
local volumewidget = wibox.container.margin(volumebg, dpi(2), dpi(7), dpi(4), dpi(4))

-- Net
local netdownicon = wibox.widget.imagebox(theme.widget_netdown)
local netdowninfo = wibox.widget.textbox()
local netupicon = wibox.widget.imagebox(theme.widget_netup)
local netupinfo = lain.widget.net(
    {
        settings = function()
            if iface ~= "network off" and string.match(theme.weather.widget.text, "N/A") then
--                 theme.weather.update()
            end

            local recv = tonumber(net_now.received)
            local sent = tonumber(net_now.sent)

            local formattedRecv = string.format('%4.1f Mb/s', recv)
            local foamattedSent = string.format('%4.1f Mb/s', sent)

            widget:set_markup(markup.fontfg(theme.font, "#e54c62", foamattedSent))
            netdowninfo:set_markup(markup.fontfg(theme.font, "#87af5f", formattedRecv))
        end
    }
)

-- MEM
local memicon = wibox.widget.imagebox(theme.widget_mem)
local memory = lain.widget.mem(
    {
        settings = function()
            local mem = tonumber(mem_now.used);
            local fMem = string.format("%4dMB ", mem);
            widget:set_markup(markup.fontfg(theme.font, "#e0da37", fMem))
        end
    }
)

-- MPD
local musicplr = "urxvt -title Music -g 130x34-320+16 -e ncmpcpp"
local mpdicon = wibox.widget.imagebox(theme.widget_music)
mpdicon:buttons(
    my_table.join(
        awful.button(
            { modkey }, 1, function()
                awful.spawn.with_shell(musicplr)
            end
        ), --[[awful.button({ }, 1, function ()
        awful.spawn.with_shell("mpc prev")
        theme.mpd.update()
    end),
    --]] awful.button(
            {}, 2, function()
                awful.spawn.with_shell("mpc toggle")
                theme.mpd.update()
            end
        ), awful.button(
            { modkey }, 3, function()
                awful.spawn.with_shell("pkill ncmpcpp")
            end
        ), awful.button(
            {}, 3, function()
                awful.spawn.with_shell("mpc stop")
                theme.mpd.update()
            end
        )
    )
)
theme.mpd = lain.widget.mpd(
    {
        settings = function()
            if mpd_now.state == "play" then
                artist = " " .. mpd_now.artist .. " "
                title = mpd_now.title .. " "
                mpdicon:set_image(theme.widget_music_on)
                widget:set_markup(markup.font(theme.font, markup("#FFFFFF", artist) .. " " .. title))
            elseif mpd_now.state == "pause" then
                widget:set_markup(markup.font(theme.font, " mpd paused "))
                mpdicon:set_image(theme.widget_music_pause)
            else
                widget:set_text("")
                mpdicon:set_image(theme.widget_music)
            end
        end
    }
)

function theme.at_screen_connect(s)
    -- Quake application
    -- s.quake = lain.util.quake({ app = awful.util.terminal })
    s.quake = lain.util.quake(
        {
            app = "urxvt",
            height = 0.50,
            argname = "--name %s"
         }
    )

    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- Tags
    -- awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])
    --    awful.tag(my_tags.screens[screen_index].names, s, my_tags.screens[screen_index].layout)

    screen_index = s.index
    local mscreen = new_tags.screens[screen_index]
    for index, tag in next, mscreen.tags, nil do
        awful.tag.add(
            tag[1], -- tag.name
            {
                layout = tag[2], -- tag.layout
                screen = s,
                selected = index == 1
            }
        )
    end

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(
        my_table.join(
            awful.button(
                {}, 1, function()
                    awful.layout.inc(1)
                end
            ), awful.button(
                {}, 3, function()
                    awful.layout.inc(-1)
                end
            ), awful.button(
                {}, 4, function()
                    awful.layout.inc(1)
                end
            ), awful.button(
                {}, 5, function()
                    awful.layout.inc(-1)
                end
            )
        )
    )
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

    -- Create a default tasklist widget
    --    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

    -- Start custom mytasklist
    s.mytasklist = awful.widget.tasklist {
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = awful.util.tasklist_buttons,
        style = {
            shape_border_width = 1,
            shape_border_color = '#777777',
            shape = gears.shape.rounded_bar
         },
        layout = {
            spacing = 10,
            spacing_widget = {
                {
                    forced_width = 5,
                    shape = gears.shape.circle,
                    widget = wibox.widget.separator
                 },
                valign = 'center',
                halign = 'center',
                widget = wibox.container.place
            },
            layout = wibox.layout.flex.horizontal
        },
        -- Notice that there is *NO* wibox.wibox prefix, it is a template,
        -- not a widget instance.
        widget_template = {
            {
                {
                    {
                        {
                            id = 'icon_role',
                            widget = wibox.widget.imagebox
                         },
                        margins = 2,
                        widget = wibox.container.margin
                    },
                    {
                        id = 'text_role',
                        widget = wibox.widget.textbox
                     },
                    layout = wibox.layout.fixed.horizontal
                },
                left = 10,
                right = 10,
                widget = wibox.container.margin
            },
            id = 'background_role',
            widget = wibox.container.background
        }
    }
    -- End custom mytasklist

    -- Create the wibox
    s.mywibox = awful.wibar(
        {
            position = "top",
            screen = s,
            height = dpi(20),
            bg = theme.bg_normal,
            fg = theme.fg_normal
         }
    )

    -- Add widgets to the wibox
    s.mywibox:setup{
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            -- s.mylayoutbox,
            s.mytaglist,
            s.mypromptbox
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            -- mailicon,
            -- mail.widget,
            -- mpdicon,
            -- theme.mpd.widget,
            netupicon,
            netupinfo.widget,
            netdownicon,
            netdowninfo,
            -- volicon,
            -- theme.volume.widget,
            memicon,
            memory.widget,
            cpuicon,
            cpu.widget,
            -- weathericon,
            -- theme.weather.widget,
            -- tempicon,
            -- temp.widget,
            wibox.widget.systray(),
            keyboardlayout,
            -- mpdicon,
            -- theme.mpd.widget,
            volicon,
            volumewidget,
            baticon,
            bat.widget,
            bar_spr,
            -- clockicon,
            mytextclock,
            bar_spr,
            s.mylayoutbox
        }
    }

    -- Create the bottom wibox
    -- s.mybottomwibox = awful.wibar({ position = "bottom", screen = s, border_width = 0, height = dpi(20), bg = theme.bg_normal, fg = theme.fg_normal })

    -- Add widgets to the bottom wibox
    -- s.mybottomwibox:setup {
    --    layout = wibox.layout.align.horizontal,
    --   { -- Left widgets
    --       layout = wibox.layout.fixed.horizontal,
    --   },
    -- s.mytasklist, -- Middle widget
    --   { -- Right widgets
    --       layout = wibox.layout.fixed.horizontal,
    --       s.mylayoutbox,
    --   },
    -- }
end

return theme
