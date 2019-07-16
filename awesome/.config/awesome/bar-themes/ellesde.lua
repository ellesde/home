local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local helpers = require("helpers")
local pad = helpers.pad

-- Create a wibox for each screen and add it
awful.screen.connect_for_each_screen(function(s)
    -- Create a system tray widget
    s.systray = wibox.widget.systray()

    -- Create a wibox that will only show the tray
    -- Hidden by default. Can be toggled with a keybind.
    s.traybox = wibox({visible = false, ontop = true, shape = helpers.rrect(beautiful.border_radius), type = "dock"})
    s.traybox.width = dpi(120)
    s.traybox.height = beautiful.wibar_height - beautiful.screen_margin * 4
    s.traybox.x = s.geometry.width - beautiful.screen_margin * 2 - s.traybox.width
    s.traybox.y = s.geometry.height - s.traybox.height - beautiful.screen_margin * 2
    s.traybox.bg = beautiful.bg_systray
    s.traybox:setup {
      pad(1),
      s.systray,
      pad(1),
      layout = wibox.layout.align.horizontal
    }
    s.traybox:buttons(gears.table.join(
                        -- Middle click - Hide traybox
                        awful.button({ }, 2, function ()
                            s.traybox.visible = false
                        end)
    ))
    -- Hide traybox when mouse leaves
    s.traybox:connect_signal("mouse::leave", function ()
            s.traybox.visible = false
    end)

    -- Create a custom text taglist
    local text_taglist = require("noodle.text_taglist")

    -- Create text weather widget
    local text_weather = require("noodle.text_weather")
    local weather_widget_icon = text_weather:get_all_children()[1]
    weather_widget_icon.font = "Typicons 11"
    local weather_widget_text = text_weather:get_all_children()[2]
    weather_widget_text.font = "sans 9"

    -- Create the wibox
    s.mywibox = awful.wibar({ position = beautiful.wibar_position, screen = s, width = beautiful.wibar_width, height = beautiful.wibar_height, shape = helpers.rrect(beautiful.wibar_border_radius)})
    -- Wibar items
    -- Add or remove widgets here
    s.mywibox:setup {
        {
            { -- Some padding
                layout = wibox.layout.fixed.horizontal
            },
            text_weather,
            spacing = dpi(12),
            layout = wibox.layout.fixed.horizontal
        },
        text_taglist,
        --window_buttons,
        expand = "none",
        layout = wibox.layout.align.horizontal
    }
end)

local s = mouse.screen
-- Show traybox when the mouse touches the rightmost edge of the wibar
-- TODO fix for wibar_position = "top"
traybox_activator = wibox({ x = s.geometry.width - 1, y = s.geometry.height - beautiful.wibar_height, height = beautiful.wibar_height, width = 1, opacity = 0, visible = true, bg = beautiful.wibar_bg })
traybox_activator:connect_signal("mouse::enter", function ()
    -- awful.screen.focused().traybox.visible = true
    s.traybox.visible = true
end)
