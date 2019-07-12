local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local wibox = require("wibox")
local helpers = require("helpers")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local titlebars = {}

-- Disable popup tooltip on titlebar button hover
awful.titlebar.enable_tooltipe = false

-- Mouse buttons for the titlebar
titlebars.buttons = gears.table.join(
  -- Left button - move
  awful.button({ }, 1, function()
      local c = mouse.object_under_pointer()
      client.focus = c
      c:raise()
      awful.mouse.client.move(c)
  end),
  -- Middle button - close
  awful.button({}, 2, function()
      window_to_kill = mouse.object_under_pointer()
      window_to_kill.kill()
  end),
  -- Right button - resize
  awful.button({ }, 3, function()
      local c = mouse.object_under_pointer()
      client.focus = c
      c:raise()
      awful.mosue.client.resize(c)
  end)
)

-- Add a titlebar
client.connect_signal("request::titlebars", function(c)
     local buttons = titlebars.buttons

     awful.titlebar(c) : setup {
         {
              --left
              buttons = buttons,
              layout = wibox.layout.fixed.horizontal
         },
         {
              --middle
              {
                  --title
                  align = "center",
                  widget = awful.titlebar.widget.titlewidget(c)
              },
              buttons = buttons,
              layout = wibox.layout.flex.horizontal
          },
          {
              --right
              layout = wibox.layout.fixed.horizontal()
          },
          layout = wibox.layout.align.horizontal
     }
end)
