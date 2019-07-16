local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local xrdb = xresources.get_current_theme()
local dpi = xresources.apply_dpi
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

-- This is used to make it easier to align the panels in specific monitor positions
local awful = require("awful")
local screen_width = awful.screen.focused().geometry.width
local scree_height = awful.screen.focused().geometry.height

local theme = {}

-- Set the theme font. This is the font that will be used by default in menus, bars, titlebars etc.
theme.font          = "Overpass Regular 9"

-- Get colors from .Xresources and set fallback colors.
theme.xbackground = xrdb.background or "#1d1f21"
theme.xforeground = xrdb.foreground or "#c5c8c6"
theme.xcolor0     = xrdb.color0     or "#282a2e"
theme.xcolor1     = xrdb.color1     or "#cc6666"
theme.xcolor2     = xrdb.color2     or "#b5bd68"
theme.xcolor3     = xrdb.color3     or "#f0c674"
theme.xcolor4     = xrdb.color4     or "#81a2be"
theme.xcolor5     = xrdb.color5     or "#b294bb"
theme.xcolor6     = xrdb.color6     or "#8abeb7"
theme.xcolor7     = xrdb.color7     or "#c5c8c6"
theme.xcolor8     = xrdb.color8     or "#969896"
theme.xcolor9     = xrdb.color9     or "#cc6666"
theme.xcolor10    = xrdb.color10    or "#b5bd68"
theme.xcolor11    = xrdb.color11    or "#f0c674"
theme.xcolor12    = xrdb.color12    or "#81a2be"
theme.xcolor13    = xrdb.color13    or "#b294bb"
theme.xcolor14    = xrdb.color14    or "#8abeb7"
theme.xcolor15    = xrdb.color15    or "#ffffff"

theme.bg_dark       = theme.xbackground
theme.bg_normal     = theme.xcolor0
theme.bg_focus      = theme.xcolor8
theme.bg_urgent     = theme.xcolor8
theme.bg_minimize   = theme.xcolor8
theme.bg_systray    = theme.xbackground

theme.fg_normal     = theme.xcolor8
theme.fg_focus      = theme.xcolor4
theme.fg_urgent     = theme.xcolor3
theme.fg_minimize   = theme.xcolor8

-- Gaps
theme.useless_gap   = dpi(5)
-- This could be used to manually determine how far away from the
-- screen edge the bars / notifications should be.
theme.screen_margin = dpi(6)

-- Borders
theme.border_width  = dpi(5)
theme.border_normal = theme.xcolor0
theme.border_focus  = theme.xcolor0
theme.border_marked = theme.xcolor0

-- Padding
theme.general_padding = { left = 0, right = 0, top = 0, bottom = 0 }

-- Rounded corners
theme.border_radius = dpi(8)

-- Titlebars
theme.titlebars_enabled = true
theme.titlebar_fg_normal = theme.xcolor8
theme.titlebar_bg_normal = theme.xcolor0
theme.titlebar_bg_focus = theme.xcolor0
theme.titlebar_title_enabled = true
theme.titlebars_imitate_borders = true

-- Tag names
theme.tagnames = {
  " 1 ",
  " 2 ",
  " 3 ",
  " 4 ",
  " 5 ",
  " 6 ",
  " 7 ",
  " 8 ",
  " 9 ",
  " 0 ",
}

-- Wibar
theme.wibar_position = "bottom"
theme.wibar_height = dpi(35)
theme.wibar_fg = theme.xcolor7
theme.wibar_bg = theme.xcolor0
theme.border_color = theme.xcolor0
theme.wibar_border_radius = dpi(0)

-- Noodle text taglist
theme.taglist_text_font = "Typicons 11"
theme.taglist_text_empty    = {"","","","","","","","","",""}
theme.taglist_text_occupied = {"","","","","","","","","",""}
theme.taglist_text_focused  = {"","","","","","","","","",""}
theme.taglist_text_urgent   = {"","","","","","","","","",""}

theme.taglist_text_color_empty    = { theme.xcolor8, theme.xcolor8, theme.xcolor8, theme.xcolor8, theme.xcolor8, theme.xcolor8, theme.xcolor8, theme.xcolor8, theme.xcolor8, theme.xcolor8 }
theme.taglist_text_color_occupied  = { theme.xcolor1, theme.xcolor2, theme.xcolor3, theme.xcolor4, theme.xcolor5, theme.xcolor6, theme.xcolor1, theme.xcolor2, theme.xcolor3, theme.xcolor4 }
theme.taglist_text_color_focused  = { theme.xcolor1, theme.xcolor2, theme.xcolor3, theme.xcolor4, theme.xcolor5, theme.xcolor6, theme.xcolor1, theme.xcolor2, theme.xcolor3, theme.xcolor4 }
theme.taglist_text_color_urgent = { theme.xcolor9, theme.xcolor10, theme.xcolor11, theme.xcolor12, theme.xcolor13, theme.xcolor14, theme.xcolor9, theme.xcolor10, theme.xcolor11, theme.xcolor12 }

-- Generate taglist squares:
local taglist_square_size = dpi(0)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
  taglist_square_size, theme.fg_focus
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
  taglist_square_size, theme.fg_normal
)

theme.menu_submenu_icon = themes_path.."default/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

theme.wallpaper = "~/.wallpaper.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
