---------------------------
-- Default awesome theme --
---------------------------

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
theme.font          = "monospace 8"

-- Get colors from .Xresources and set fallback colors.
theme.xbackground = xrdb.background or "#1d1f21"
theme.xforeground = xrdb.foreground or "#c5c8c6"
theme.xcolor0     = xrdb.color0     or "#1d1f21"
theme.xcolor1     = xrdb.color1     or "#282a2e"
theme.xcolor2     = xrdb.color2     or "#373b41"
theme.xcolor3     = xrdb.color3     or "#969896"
theme.xcolor4     = xrdb.color4     or "#b4b7b4"
theme.xcolor5     = xrdb.color5     or "#c5c8c6"
theme.xcolor6     = xrdb.color6     or "#e0e0e0"
theme.xcolor7     = xrdb.color7     or "#ffffff"
theme.xcolor8     = xrdb.color8     or "#cc6666"
theme.xcolor9     = xrdb.color9     or "#de935f"
theme.xcolor10    = xrdb.color10    or "#f0c674"
theme.xcolor11    = xrdb.color11    or "#b5bd68"
theme.xcolor12    = xrdb.color12    or "#8abeb7"
theme.xcolor13    = xrdb.color13    or "#81a2be"
theme.xcolor14    = xrdb.color14    or "#b294bb"
theme.xcolor15    = xrdb.color15    or "#a3685a"

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

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

theme.menu_submenu_icon = themes_path.."default/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

theme.wallpaper = "~/.wallpaper.png"

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path.."default/layouts/fairhw.png"
theme.layout_fairv = themes_path.."default/layouts/fairvw.png"
theme.layout_floating  = themes_path.."default/layouts/floatingw.png"
theme.layout_magnifier = themes_path.."default/layouts/magnifierw.png"
theme.layout_max = themes_path.."default/layouts/maxw.png"
theme.layout_fullscreen = themes_path.."default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path.."default/layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path.."default/layouts/tileleftw.png"
theme.layout_tile = themes_path.."default/layouts/tilew.png"
theme.layout_tiletop = themes_path.."default/layouts/tiletopw.png"
theme.layout_spiral  = themes_path.."default/layouts/spiralw.png"
theme.layout_dwindle = themes_path.."default/layouts/dwindlew.png"
theme.layout_cornernw = themes_path.."default/layouts/cornernww.png"
theme.layout_cornerne = themes_path.."default/layouts/cornernew.png"
theme.layout_cornersw = themes_path.."default/layouts/cornersww.png"
theme.layout_cornerse = themes_path.."default/layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
