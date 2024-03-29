local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local wibox = require("wibox")

local helpers = {}

-- Create rounded rectangle shape
helpers.rrect = function(radius)
  return function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height,radius)
  end
end

function helpers.colorize_text(txt, fg)
  return "<span foreground='" .. fg .."'>" .. txt .. "</span>"
end

function helpers.pad(size)
  local str = ""
  for i = 1, size do
    str = str .. " "
  end
  local pad = wibox.widget.textbox(str)
  return pad
end

return helpers
