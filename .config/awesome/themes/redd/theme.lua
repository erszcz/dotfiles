---------------------------
-- Default awesome theme --
---------------------------

theme = {}

theme.font          = "Droid-Sans 8"
theme.dmenu_font    = "Droid-Sans:pixelsize=11"

theme.bg_normal     = "#330000"
theme.bg_focus      = "#990000"
theme.bg_urgent     = "#ffffff"
theme.bg_minimize   = "#ff0000"

theme.fg_normal     = "#eebbbb"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#000000"
theme.fg_minimize   = "#ffffff"

theme.border_width  = "1"
theme.border_normal = "#330000"
theme.border_focus  = "#990000"
theme.border_marked = "#003333"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Display the taglist squares
theme.taglist_squares_sel   = "/home/erszcz/.config/awesome/themes/redd/taglist/squarefw.png"
theme.taglist_squares_unsel = "/home/erszcz/.config/awesome/themes/redd/taglist/squarew.png"

theme.tasklist_floating_icon = "/home/erszcz/.config/awesome/themes/redd/tasklist/floatingw.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = "/home/erszcz/.config/awesome/themes/redd/submenu.png"
theme.menu_height = "15"
theme.menu_width  = "100"

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = "/home/erszcz/.config/awesome/themes/redd/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = "/home/erszcz/.config/awesome/themes/redd/titlebar/close_focus.png"

theme.titlebar_ontop_button_normal_inactive = "/home/erszcz/.config/awesome/themes/redd/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = "/home/erszcz/.config/awesome/themes/redd/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = "/home/erszcz/.config/awesome/themes/redd/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = "/home/erszcz/.config/awesome/themes/redd/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = "/home/erszcz/.config/awesome/themes/redd/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = "/home/erszcz/.config/awesome/themes/redd/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = "/home/erszcz/.config/awesome/themes/redd/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = "/home/erszcz/.config/awesome/themes/redd/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = "/home/erszcz/.config/awesome/themes/redd/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = "/home/erszcz/.config/awesome/themes/redd/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = "/home/erszcz/.config/awesome/themes/redd/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = "/home/erszcz/.config/awesome/themes/redd/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = "/home/erszcz/.config/awesome/themes/redd/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = "/home/erszcz/.config/awesome/themes/redd/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = "/home/erszcz/.config/awesome/themes/redd/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = "/home/erszcz/.config/awesome/themes/redd/titlebar/maximized_focus_active.png"

-- You can use your own command to set your wallpaper
theme.wallpaper_cmd = { "awsetbg /home/erszcz/.config/awesome/themes/redd/background.png" }

-- You can use your own layout icons like this:
theme.layout_fairh = "/home/erszcz/.config/awesome/themes/redd/layouts/fairhw.png"
theme.layout_fairv = "/home/erszcz/.config/awesome/themes/redd/layouts/fairvw.png"
theme.layout_floating  = "/home/erszcz/.config/awesome/themes/redd/layouts/floatingw.png"
theme.layout_magnifier = "/home/erszcz/.config/awesome/themes/redd/layouts/magnifierw.png"
theme.layout_max = "/home/erszcz/.config/awesome/themes/redd/layouts/maxw.png"
theme.layout_fullscreen = "/home/erszcz/.config/awesome/themes/redd/layouts/fullscreenw.png"
theme.layout_tilebottom = "/home/erszcz/.config/awesome/themes/redd/layouts/tilebottomw.png"
theme.layout_tileleft   = "/home/erszcz/.config/awesome/themes/redd/layouts/tileleftw.png"
theme.layout_tile = "/home/erszcz/.config/awesome/themes/redd/layouts/tilew.png"
theme.layout_tiletop = "/home/erszcz/.config/awesome/themes/redd/layouts/tiletopw.png"
theme.layout_spiral  = "/home/erszcz/.config/awesome/themes/redd/layouts/spiralw.png"
theme.layout_dwindle = "/home/erszcz/.config/awesome/themes/redd/layouts/dwindlew.png"

theme.awesome_icon = "/home/erszcz/.config/awesome/icons/awesome16_red.png"

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:encoding=utf-8:textwidth=80
