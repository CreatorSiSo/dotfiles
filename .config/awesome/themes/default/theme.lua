local dpi = require("beautiful.xresources").apply_dpi
local config_dir = require("gears.filesystem").get_configuration_dir()

-- Main
local theme = {}
theme.name = "default"
theme.dir = config_dir .. "themes/" .. theme.name .. "/"

-- Default variables
theme.bg_normal  = "#00000059"
theme.fg_normal  = "#dcdcdc"

theme.font      = "FiraCode Nerd Font 9"
theme.bg_focus   = "#ffffff"
theme.bg_urgent  = "#ff0000"
theme.bg_minimize = "#0000ff"
theme.bg_systray = "#00ff00"
theme.fg_focus   = "#f0f0f0"
theme.fg_urgent  = "#CC9393"
-- theme.fg_minimize = nil
theme.wallpaper = theme.dir .. "dreams.png"

-- Gaps
theme.useless_gap   = dpi(8)

-- Border
theme.border_normal = "#353535"
theme.border_focus  = "#3f3f3f"
theme.border_marked = "#CC9393"
theme.border_width  = dpi(1)

theme.maximized_hide_border = true
theme.fullscreen_hide_border = true

-- arcchart
-- theme.arcchart_border_color = nil
-- theme.arcchart_color = nil
-- theme.arcchart_border_width = nil
-- theme.arcchart_paddings = nil
-- theme.arcchart_thickness = nil

-- awesome
theme.awesome_icon = theme.dir .. "awesome-icon.png"

-- calendar
-- theme.calendar_style = nil
-- theme.calendar_font = nil
-- theme.calendar_spacing = nil
-- theme.calendar_week_numbers = nil
-- theme.calendar_start_sunday = nil
-- theme.calendar_long_weekdays = nil

-- checkbox
-- theme.checkbox_border_width = nil
-- theme.checkbox_bg = nil
-- theme.checkbox_border_color = nil
-- theme.checkbox_check_border_color = nil
-- theme.checkbox_check_border_width = nil
-- theme.checkbox_check_color = nil
-- theme.checkbox_shape = nil
-- theme.checkbox_check_shape = nil
-- theme.checkbox_paddings = nil
-- theme.checkbox_color = nil

-- column
-- theme.column_count = nil

-- cursor
-- theme.cursor_mouse_resize = nil
-- theme.cursor_mouse_move = nil
theme.mouse_finder_color = "#CC9393"

-- enable
-- theme.enable_spawn_cursor = nil

-- flex
-- theme.flex_height = nil

-- gap
-- theme.gap_single_client = nil

-- graph
-- theme.graph_fg = nil
-- theme.graph_bg = nil
-- theme.graph_border_color = nil

-- hotkeys
-- theme.hotkeys_bg = nil
-- theme.hotkeys_fg = nil
-- theme.hotkeys_border_width = nil
-- theme.hotkeys_border_color = nil
-- theme.hotkeys_shape = nil
-- theme.hotkeys_modifiers_fg = nil
-- theme.hotkeys_label_bg = nil
-- theme.hotkeys_label_fg = nil
-- theme.hotkeys_font = nil
-- theme.hotkeys_description_font = nil
-- theme.hotkeys_group_margin = nil

-- icon
-- theme.icon_theme = nil

-- layout
-- theme.layout_cornernw = nil
-- theme.layout_cornerne = nil
-- theme.layout_cornersw = nil
-- theme.layout_cornerse = nil
-- theme.layout_fairh = nil
-- theme.layout_fairv = nil
-- theme.layout_floating = nil
-- theme.layout_magnifier = nil
-- theme.layout_max = nil
-- theme.layout_fullscreen = nil
-- theme.layout_spiral = nil
-- theme.layout_dwindle = nil
-- theme.layout_tile = nil
-- theme.layout_tiletop = nil
-- theme.layout_tilebottom = nil
-- theme.layout_tileleft = nil

-- layoutlist
-- theme.layoutlist_fg_normal = nil
-- theme.layoutlist_bg_normal = nil
-- theme.layoutlist_fg_selected = nil
-- theme.layoutlist_bg_selected = nil
-- theme.layoutlist_disable_icon = nil
-- theme.layoutlist_disable_name = nil
-- theme.layoutlist_font = nil
-- theme.layoutlist_align = nil
-- theme.layoutlist_font_selected = nil
-- theme.layoutlist_spacing = nil
-- theme.layoutlist_shape = nil
-- theme.layoutlist_shape_border_width = nil
-- theme.layoutlist_shape_border_color = nil
-- theme.layoutlist_shape_selected = nil
-- theme.layoutlist_shape_border_width_selected = nil
-- theme.layoutlist_shape_border_color_selected = nil

-- master
-- theme.master_width_factor = nil
-- theme.master_fill_policy = nil
-- theme.master_count = nil

-- maximized
-- theme.maximized_honor_padding = nil
-- theme.maximized_hide_border = nil

-- menu
theme.menu_submenu_icon = theme.dir .. "submenu.png"
-- theme.menu_font = nil
theme.menu_height = dpi(20)
theme.menu_width  = dpi(200)
-- theme.menu_border_color = nil
-- theme.menu_border_width = nil
-- theme.menu_fg_focus = nil
-- theme.menu_bg_focus = nil
-- theme.menu_fg_normal = nil
-- theme.menu_bg_normal = nil
-- theme.menu_submenu = nil
-- menubar
-- theme.menubar_fg_normal = nil
-- theme.menubar_bg_normal = nil
-- theme.menubar_border_width = nil
-- theme.menubar_border_color = nil
-- theme.menubar_fg_focus = nil
-- theme.menubar_bg_focus = nil
-- theme.menubar_font = nil

-- notification
-- theme.notification_max_width = nil
-- theme.notification_position = nil
-- theme.notification_action_underline_normal = nil
-- theme.notification_action_underline_selected = nil
-- theme.notification_action_icon_only = nil
-- theme.notification_action_label_only = nil
-- theme.notification_action_shape_normal = nil
-- theme.notification_action_shape_selected = nil
-- theme.notification_action_shape_border_color_normal = nil
-- theme.notification_action_shape_border_color_selected = nil
-- theme.notification_action_shape_border_width_normal = nil
-- theme.notification_action_shape_border_width_selected = nil
-- theme.notification_action_icon_size_normal = nil
-- theme.notification_action_icon_size_selected = nil
-- theme.notification_action_bg_normal = nil
-- theme.notification_action_bg_selected = nil
-- theme.notification_action_fg_normal = nil
-- theme.notification_action_fg_selected = nil
-- theme.notification_action_bgimage_normal = nil
-- theme.notification_action_bgimage_selected = nil
-- theme.notification_shape_normal = nil
-- theme.notification_shape_selected = nil
-- theme.notification_shape_border_color_normal = nil
-- theme.notification_shape_border_color_selected = nil
-- theme.notification_shape_border_width_normal = nil
-- theme.notification_shape_border_width_selected = nil
-- theme.notification_icon_size_normal = nil
-- theme.notification_icon_size_selected = nil
-- theme.notification_bg_normal = nil
-- theme.notification_bg_selected = nil
-- theme.notification_fg_normal = nil
-- theme.notification_fg_selected = nil
-- theme.notification_bgimage_normal = nil
-- theme.notification_bgimage_selected = nil
-- theme.notification_font = nil
-- theme.notification_bg = nil
-- theme.notification_fg = nil
-- theme.notification_border_width = nil
-- theme.notification_border_color = nil
-- theme.notification_shape = nil
-- theme.notification_opacity = nil
-- theme.notification_margin = nil
-- theme.notification_width = nil
-- theme.notification_height = nil
-- theme.notification_spacing = nil
-- theme.notification_icon_resize_strategy = nil

-- opacity
-- theme.opacity_normal = nil
-- theme.opacity_active = nil
-- theme.opacity_urgent = nil
-- theme.opacity_new = nil
-- theme.opacity_floating_normal = nil
-- theme.opacity_floating_active = nil
-- theme.opacity_floating_urgent = nil
-- theme.opacity_floating_new = nil
-- theme.opacity_maximized_normal = nil
-- theme.opacity_maximized_active = nil
-- theme.opacity_maximized_urgent = nil
-- theme.opacity_maximized_new = nil
-- theme.opacity_fullscreen_normal = nil
-- theme.opacity_fullscreen_active = nil
-- theme.opacity_fullscreen_urgent = nil
-- theme.opacity_fullscreen_new = nil

-- piechart
-- theme.piechart_border_color = nil
-- theme.piechart_border_width = nil
-- theme.piechart_colors = nil

-- progressbar
-- theme.progressbar_bg = nil
-- theme.progressbar_fg = nil
-- theme.progressbar_shape = nil
-- theme.progressbar_border_color = nil
-- theme.progressbar_border_width = nil
-- theme.progressbar_bar_shape = nil
-- theme.progressbar_bar_border_width = nil
-- theme.progressbar_bar_border_color = nil
-- theme.progressbar_margins = nil
-- theme.progressbar_paddings = nil

-- prompt
-- theme.prompt_fg_cursor = nil
-- theme.prompt_bg_cursor = nil
-- theme.prompt_font = nil
-- theme.prompt_fg = nil
-- theme.prompt_bg = nil

-- radialprogressbar
-- theme.radialprogressbar_border_color = nil
-- theme.radialprogressbar_color = nil
-- theme.radialprogressbar_border_width = nil
-- theme.radialprogressbar_paddings = nil

-- separator
-- theme.separator_thickness = nil
-- theme.separator_border_color = nil
-- theme.separator_border_width = nil
-- theme.separator_span_ratio = nil
-- theme.separator_color = nil
-- theme.separator_shape = nil

-- slider
-- theme.slider_bar_border_width = nil
-- theme.slider_bar_border_color = nil
-- theme.slider_handle_border_color = nil
-- theme.slider_handle_border_width = nil
-- theme.slider_handle_width = nil
-- theme.slider_handle_color = nil
-- theme.slider_handle_shape = nil
-- theme.slider_bar_shape = nil
-- theme.slider_bar_height = nil
-- theme.slider_bar_margins = nil
-- theme.slider_handle_margins = nil
-- theme.slider_bar_color = nil
-- theme.slider_bar_active_color = nil

-- snap
-- theme.snap_bg = nil
-- theme.snap_border_width = nil
-- theme.snap_shape = nil

-- snapper
-- theme.snapper_gap = nil

-- systray
-- theme.systray_max_rows = nil
-- theme.systray_icon_spacing = nil

-- taglist
-- theme.taglist_fg_focus = nil
theme.taglist_bg_focus = "#ffff00"
-- theme.taglist_fg_urgent = nil
theme.taglist_bg_urgent = "#ffff00"
-- theme.taglist_fg_occupied = nil
theme.taglist_bg_occupied = "#ffff00"
-- theme.taglist_fg_empty = nil
theme.taglist_bg_empty = "#ffff00"
-- theme.taglist_fg_volatile = nil
theme.taglist_bg_volatile = "#ffff00"
theme.taglist_squares_sel   = theme.dir .. "taglist/squarefz.png"
theme.taglist_squares_unsel = theme.dir .. "taglist/squarez.png"
-- theme.taglist_squares_sel_empty = nil
-- theme.taglist_squares_unsel_empty = nil
--theme.taglist_squares_resize = "false"
-- theme.taglist_disable_icon = nil
-- theme.taglist_font = nil
theme.taglist_spacing = 2
-- theme.taglist_shape = nil
-- theme.taglist_shape_border_width = nil
-- theme.taglist_shape_border_color = nil
-- theme.taglist_shape_empty = nil
-- theme.taglist_shape_border_width_empty = nil
-- theme.taglist_shape_border_color_empty = nil
-- theme.taglist_shape_focus = nil
-- theme.taglist_shape_border_width_focus = nil
-- theme.taglist_shape_border_color_focus = nil
-- theme.taglist_shape_urgent = nil
-- theme.taglist_shape_border_width_urgent = nil
-- theme.taglist_shape_border_color_urgent = nil
-- theme.taglist_shape_volatile = nil
-- theme.taglist_shape_border_width_volatile = nil
-- theme.taglist_shape_border_color_volatile = nil

-- tasklist
-- theme.tasklist_fg_normal = nil
-- theme.tasklist_bg_normal = nil
-- theme.tasklist_fg_focus = nil
-- theme.tasklist_bg_focus = nil
-- theme.tasklist_fg_urgent = nil
-- theme.tasklist_bg_urgent = nil
-- theme.tasklist_fg_minimize = nil
-- theme.tasklist_bg_minimize = nil
-- theme.tasklist_bg_image_normal = nil
-- theme.tasklist_bg_image_focus = nil
-- theme.tasklist_bg_image_urgent = nil
-- theme.tasklist_bg_image_minimize = nil
-- theme.tasklist_disable_icon = nil
-- theme.tasklist_disable_task_name = nil
-- theme.tasklist_plain_task_name = nil
-- theme.tasklist_sticky = nil
-- theme.tasklist_ontop = nil
-- theme.tasklist_above = nil
-- theme.tasklist_below = nil
-- theme.tasklist_floating = nil
-- theme.tasklist_maximized = nil
-- theme.tasklist_maximized_horizontal = nil
-- theme.tasklist_maximized_vertical = nil
-- theme.tasklist_minimized = nil
-- theme.tasklist_font = nil
-- theme.tasklist_align = nil
-- theme.tasklist_font_focus = nil
-- theme.tasklist_font_minimized = nil
-- theme.tasklist_font_urgent = nil
-- theme.tasklist_spacing = nil
-- theme.tasklist_shape = nil
-- theme.tasklist_shape_border_width = nil
-- theme.tasklist_shape_border_color = nil
-- theme.tasklist_shape_focus = nil
-- theme.tasklist_shape_border_width_focus = nil
-- theme.tasklist_shape_border_color_focus = nil
-- theme.tasklist_shape_minimized = nil
-- theme.tasklist_shape_border_width_minimized = nil
-- theme.tasklist_shape_border_color_minimized = nil
-- theme.tasklist_shape_urgent = nil
-- theme.tasklist_shape_border_width_urgent = nil
-- theme.tasklist_shape_border_color_urgent = nil

-- titlebar
theme.titlebar_bg_focus  = "#353535"
theme.titlebar_bg_normal = "#353535"
-- theme.titlebar_bgimage_normal = nil
-- theme.titlebar_fg = nil
-- theme.titlebar_bg = nil
-- theme.titlebar_bgimage = nil
-- theme.titlebar_fg_focus = nil
-- theme.titlebar_bg_focus = nil
-- theme.titlebar_bgimage_focus = nil
-- theme.titlebar_fg_urgent = nil
-- theme.titlebar_bg_urgent = nil
-- theme.titlebar_bgimage_urgent = nil
-- theme.titlebar_floating_button_normal = nil
-- theme.titlebar_maximized_button_normal = nil
-- theme.titlebar_minimize_button_normal = nil
-- theme.titlebar_minimize_button_normal_hover = nil
-- theme.titlebar_minimize_button_normal_press = nil
-- theme.titlebar_close_button_normal = nil
-- theme.titlebar_close_button_normal_hover = nil
-- theme.titlebar_close_button_normal_press = nil
-- theme.titlebar_ontop_button_normal = nil
-- theme.titlebar_sticky_button_normal = nil
-- theme.titlebar_floating_button_focus = nil
-- theme.titlebar_maximized_button_focus = nil
-- theme.titlebar_minimize_button_focus = nil
-- theme.titlebar_minimize_button_focus_hover = nil
-- theme.titlebar_minimize_button_focus_press = nil
-- theme.titlebar_close_button_focus = nil
-- theme.titlebar_close_button_focus_hover = nil
-- theme.titlebar_close_button_focus_press = nil
-- theme.titlebar_ontop_button_focus = nil
-- theme.titlebar_sticky_button_focus = nil
-- theme.titlebar_floating_button_normal_active = nil
-- theme.titlebar_floating_button_normal_active_hover = nil
-- theme.titlebar_floating_button_normal_active_press = nil
-- theme.titlebar_maximized_button_normal_active = nil
-- theme.titlebar_maximized_button_normal_active_hover = nil
-- theme.titlebar_maximized_button_normal_active_press = nil
-- theme.titlebar_ontop_button_normal_active = nil
-- theme.titlebar_ontop_button_normal_active_hover = nil
-- theme.titlebar_ontop_button_normal_active_press = nil
-- theme.titlebar_sticky_button_normal_active = nil
-- theme.titlebar_sticky_button_normal_active_hover = nil
-- theme.titlebar_sticky_button_normal_active_press = nil
-- theme.titlebar_floating_button_focus_active = nil
-- theme.titlebar_floating_button_focus_active_hover = nil
-- theme.titlebar_floating_button_focus_active_press = nil
-- theme.titlebar_maximized_button_focus_active = nil
-- theme.titlebar_maximized_button_focus_active_hover = nil
-- theme.titlebar_maximized_button_focus_active_press = nil
-- theme.titlebar_ontop_button_focus_active = nil
-- theme.titlebar_ontop_button_focus_active_hover = nil
-- theme.titlebar_ontop_button_focus_active_press = nil
-- theme.titlebar_sticky_button_focus_active = nil
-- theme.titlebar_sticky_button_focus_active_hover = nil
-- theme.titlebar_sticky_button_focus_active_press = nil
-- theme.titlebar_floating_button_normal_inactive = nil
-- theme.titlebar_floating_button_normal_inactive_hover = nil
-- theme.titlebar_floating_button_normal_inactive_press = nil
-- theme.titlebar_maximized_button_normal_inactive = nil
-- theme.titlebar_maximized_button_normal_inactive_hover = nil
-- theme.titlebar_maximized_button_normal_inactive_press = nil
-- theme.titlebar_ontop_button_normal_inactive = nil
-- theme.titlebar_ontop_button_normal_inactive_hover = nil
-- theme.titlebar_ontop_button_normal_inactive_press = nil
-- theme.titlebar_sticky_button_normal_inactive = nil
-- theme.titlebar_sticky_button_normal_inactive_hover = nil
-- theme.titlebar_sticky_button_normal_inactive_press = nil
-- theme.titlebar_floating_button_focus_inactive = nil
-- theme.titlebar_floating_button_focus_inactive_hover = nil
-- theme.titlebar_floating_button_focus_inactive_press = nil
-- theme.titlebar_maximized_button_focus_inactive = nil
-- theme.titlebar_maximized_button_focus_inactive_hover = nil
-- theme.titlebar_maximized_button_focus_inactive_press = nil
-- theme.titlebar_ontop_button_focus_inactive = nil
-- theme.titlebar_ontop_button_focus_inactive_hover = nil
-- theme.titlebar_ontop_button_focus_inactive_press = nil
-- theme.titlebar_sticky_button_focus_inactive = nil
-- theme.titlebar_sticky_button_focus_inactive_hover = nil
-- theme.titlebar_sticky_button_focus_inactive_press = nil

-- tooltip
-- theme.tooltip_border_color = nil
-- theme.tooltip_bg = nil
-- theme.tooltip_fg = nil
-- theme.tooltip_font = nil
-- theme.tooltip_border_width = nil
-- theme.tooltip_opacity = nil
-- theme.tooltip_gaps = nil
-- theme.tooltip_shape = nil
-- theme.tooltip_align = nil

-- wallpaper
-- theme.wallpaper_bg = nil
-- theme.wallpaper_fg = nil

-- wibar
-- theme.wibar_stretch = nil
-- theme.wibar_favor_vertical = nil
-- theme.wibar_border_width = nil
-- theme.wibar_border_color = nil
-- theme.wibar_ontop = nil
-- theme.wibar_cursor = nil
-- theme.wibar_opacity = nil
-- theme.wibar_type = nil
-- theme.wibar_width = nil
-- theme.wibar_height = nil
-- theme.wibar_bg = nil
-- theme.wibar_bgimage = nil
-- theme.wibar_fg = nil
-- theme.wibar_shape = nil
-- theme.wibar_margins = nil
-- theme.wibar_align = nil


-- Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.fg_widget        = "#AECF96"
--theme.fg_center_widget = "#88A175"
--theme.fg_end_widget    = "#FF5656"
-- theme.bg_widget        = "#494B4F"
--theme.border_widget    = "#3F3F3F"


-- Layout
theme.layout_tile       = theme.dir .. "layouts/tile.png"
theme.layout_tileleft   = theme.dir .. "layouts/tileleft.png"
theme.layout_tilebottom = theme.dir .. "layouts/tilebottom.png"
theme.layout_tiletop    = theme.dir .. "layouts/tiletop.png"
theme.layout_fairv      = theme.dir .. "layouts/fairv.png"
theme.layout_fairh      = theme.dir .. "layouts/fairh.png"
theme.layout_spiral     = theme.dir .. "layouts/spiral.png"
theme.layout_dwindle    = theme.dir .. "layouts/dwindle.png"
theme.layout_max        = theme.dir .. "layouts/max.png"
theme.layout_fullscreen = theme.dir .. "layouts/fullscreen.png"
theme.layout_magnifier  = theme.dir .. "layouts/magnifier.png"
theme.layout_floating   = theme.dir .. "layouts/floating.png"
theme.layout_cornernw   = theme.dir .. "layouts/cornernw.png"
theme.layout_cornerne   = theme.dir .. "layouts/cornerne.png"
theme.layout_cornersw   = theme.dir .. "layouts/cornersw.png"
theme.layout_cornerse   = theme.dir .. "layouts/cornerse.png"

-- Titlebar
theme.titlebar_close_button_focus  = theme.dir .. "titlebar/close_focus.png"
theme.titlebar_close_button_normal = theme.dir .. "titlebar/close_normal.png"

theme.titlebar_minimize_button_normal = theme.dir .. "titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = theme.dir .. "titlebar/minimize_focus.png"

theme.titlebar_ontop_button_focus_active  = theme.dir .. "titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = theme.dir .. "titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = theme.dir .. "titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = theme.dir .. "titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  = theme.dir .. "titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = theme.dir .. "titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = theme.dir .. "titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = theme.dir .. "titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active  = theme.dir .. "titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = theme.dir .. "titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = theme.dir .. "titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = theme.dir .. "titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  = theme.dir .. "titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = theme.dir .. "titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "titlebar/maximized_normal_inactive.png"

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
