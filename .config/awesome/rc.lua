-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")

-- Widget and layout library
local wibox = require("wibox")

-- Theme handling library
local beautiful = require("beautiful")

-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- Handle runtime errors after startup
do
	local in_error = false
	awesome.connect_signal("debug::error", function (err)
		-- Make sure we don't go into an endless error loop
		if in_error then return end
		in_error = true

		naughty.notify({ preset = naughty.config.presets.critical,
						 title = "Oops, an error happened!",
						 text = tostring(err) })
		in_error = false
	end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init(gears.filesystem.get_configuration_dir () .. "themes/default/theme.lua")

-- This is used later as the default terminal and editor to run.
Terminal = "alacritty"
Editor = os.getenv("EDITOR") or "micro"
EditorCmd = Terminal .. " -e " .. Editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
Modkey = "Mod4"

awful.layout.layouts = require("config.layouts")

-- {{{ Menu
-- Create a launcher widget and a main menu
AwesomeMenu = {
 { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
 { "manual", Terminal .. " -e man awesome" },
 { "edit config", EditorCmd .. " " .. awesome.conffile },
 { "restart", awesome.restart },
 { "quit", function() awesome.quit() end },
}

local main_menu = awful.menu({
	items = {
		{ "awesome", AwesomeMenu, beautiful.awesome_icon },
		{ "open terminal", Terminal }
	}
})

local main_launcher = awful.widget.launcher({
	image = beautiful.awesome_icon, menu = main_menu
})

-- Menubar configuration
menubar.utils.terminal = Terminal -- Set the terminal for applications that require it
-- }}}

-- Keyboard map indicator and switcher
KeyboardLayout = awful.widget.keyboardlayout()

-- {{{ Wibar
-- Create a textclock widget
TextClock = wibox.widget.textclock()

-- Create a wibox for each screen and add it
local workspace_buttons = gears.table.join(
					awful.button({ }, 1, function(t) t:view_only() end),
					awful.button({ Modkey }, 1, function(t)
											if client.focus then
												client.focus:move_to_tag(t)
											end
										end),
					awful.button({ }, 3, awful.tag.viewtoggle),
					awful.button({ Modkey }, 3, function(t)
											if client.focus then
												client.focus:toggle_tag(t)
											end
										end),
					awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
					awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
				)

local tasklist_buttons = gears.table.join(
					 awful.button({ }, 1, function (c)
											if c == client.focus then
												c.minimized = true
											else
												c:emit_signal(
													"request::activate",
													"tasklist",
													{raise = true}
												)
											end
										end),
					 awful.button({ }, 3, function()
											awful.menu.client_list({ theme = { width = 250 } })
										end),
					 awful.button({ }, 4, function ()
											awful.client.focus.byidx(1)
										end),
					 awful.button({ }, 5, function ()
											awful.client.focus.byidx(-1)
										end))

local function set_wallpaper(screen)
	-- Wallpaper
	if beautiful.wallpaper then
		local wallpaper = beautiful.wallpaper
		-- If wallpaper is a function, call it with the screen
		if type(wallpaper) == "function" then
			wallpaper = wallpaper(screen)
		end
		gears.wallpaper.maximized(wallpaper, screen, true)
	end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(screen)
	-- Wallpaper
	set_wallpaper(screen)

	-- Each screen has its own tag table.
	awful.tag({ "web", "dev", "sys" }, screen, awful.layout.layouts[1])

	-- Create a promptbox for each screen
	screen.mypromptbox = awful.widget.prompt()
	-- Create an imagebox widget which will contain an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	screen.layout_switcher = awful.widget.layoutbox(screen)
	screen.layout_switcher:buttons(gears.table.join(
						 awful.button({ }, 1, function () awful.layout.inc( 1) end),
						 awful.button({ }, 3, function () awful.layout.inc(-1) end),
						 awful.button({ }, 4, function () awful.layout.inc( 1) end),
						 awful.button({ }, 5, function () awful.layout.inc(-1) end)))
	-- Create a taglist widget
	screen.workspace_switcher = awful.widget.taglist {
		screen  = screen,
		filter  = awful.widget.taglist.filter.all,
		buttons = workspace_buttons
	}

	-- Create a tasklist widget
	screen.mytasklist = awful.widget.tasklist {
		screen  = screen,
		filter  = awful.widget.tasklist.filter.currenttags,
		buttons = tasklist_buttons
	}

	-- Create the wibox
	screen.mywibox = awful.wibar({ position = "top", screen = screen })

	-- Add widgets to the wibox
	screen.mywibox:setup {
		layout = wibox.layout.align.horizontal,
		{ -- Left widgets
			layout = wibox.layout.fixed.horizontal,
			main_launcher,
			screen.workspace_switcher,
			screen.mypromptbox,
		},
		screen.mytasklist, -- Middle widget
		{ -- Right widgets
			layout = wibox.layout.fixed.horizontal,
			KeyboardLayout,
			wibox.widget.systray(),
			TextClock,
			screen.layout_switcher,
		},
	}
end)
-- }}}

-- {{{ Mouse bindings
root.buttons(gears.table.join(
	awful.button({ }, 3, function () main_menu:toggle() end),
	awful.button({ }, 4, awful.tag.viewnext),
	awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
local global_keys = gears.table.join(
	awful.key({ Modkey,           }, "h",      hotkeys_popup.show_help,
			{description="show help", group="awesome"}),
	awful.key({ Modkey,           }, "Left",   awful.tag.viewprev,
			{description = "view previous", group = "tag"}),
	awful.key({ Modkey,           }, "Right",  awful.tag.viewnext,
			{description = "view next", group = "tag"}),
	awful.key({ Modkey,           }, "Escape", awful.tag.history.restore,
			{description = "go back", group = "tag"}),

	awful.key({ Modkey,           }, "j",
		function ()
			awful.client.focus.byidx( 1)
		end,
		{description = "focus next by index", group = "client"}
	),
	awful.key({ Modkey,           }, "k",
		function ()
			awful.client.focus.byidx(-1)
		end,
		{description = "focus previous by index", group = "client"}
	),
	awful.key({ Modkey,           }, "w", function () main_menu:show() end,
			{description = "show main menu", group = "awesome"}),

	-- Layout manipulation
	awful.key({ Modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
			{description = "swap with next client by index", group = "client"}),
	awful.key({ Modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
			{description = "swap with previous client by index", group = "client"}),
	awful.key({ Modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
			{description = "focus the next screen", group = "screen"}),
	awful.key({ Modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
			{description = "focus the previous screen", group = "screen"}),
	awful.key({ Modkey,           }, "u", awful.client.urgent.jumpto,
			{description = "jump to urgent client", group = "client"}),
	awful.key({ Modkey,           }, "Tab",
		function ()
			awful.client.focus.history.previous()
			if client.focus then
				client.focus:raise()
			end
		end,
		{description = "go back", group = "client"}),

	-- Standard program
	awful.key({ Modkey,           }, "Return", function () awful.spawn(Terminal) end,
			{description = "open a terminal", group = "launcher"}),
	awful.key({ Modkey, "Control" }, "r", awesome.restart,
			{description = "reload awesome", group = "awesome"}),
	awful.key({ Modkey, "Shift"   }, "q", awesome.quit,
			{description = "quit awesome", group = "awesome"}),

	awful.key({ Modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
			{description = "increase master width factor", group = "layout"}),
	awful.key({ Modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
			{description = "decrease master width factor", group = "layout"}),
	awful.key({ Modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
			{description = "increase the number of master clients", group = "layout"}),
	awful.key({ Modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
			{description = "decrease the number of master clients", group = "layout"}),
	awful.key({ Modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
			{description = "increase the number of columns", group = "layout"}),
	awful.key({ Modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
			{description = "decrease the number of columns", group = "layout"}),
	awful.key({ Modkey,           }, "space", function () awful.layout.inc( 1)                end,
			{description = "select next", group = "layout"}),
	awful.key({ Modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
			{description = "select previous", group = "layout"}),

	awful.key({ Modkey, "Control" }, "n",
			function ()
				local c = awful.client.restore()
				-- Focus restored client
				if c then
					c:emit_signal(
						"request::activate", "key.unminimize", {raise = true}
					)
				end
			end,
			{description = "restore minimized", group = "client"}),

	-- Prompt
	awful.key({ Modkey },            "r",     function () awful.screen.focused().mypromptbox:run() end,
			{description = "run prompt", group = "launcher"}),

	awful.key({ Modkey }, "x",
			function ()
				awful.prompt.run {
					prompt       = "Run Lua code: ",
					textbox      = awful.screen.focused().mypromptbox.widget,
					exe_callback = awful.util.eval,
					history_path = awful.util.get_cache_dir() .. "/history_eval"
				}
			end,
			{description = "lua execute prompt", group = "awesome"}),
	-- Menubar
	awful.key({ Modkey }, "s", function() menubar.show() end,
			{description = "show the menubar", group = "launcher"})
)

local clientkeys = gears.table.join(
	awful.key({ Modkey,           }, "f",
		function (c)
			c.fullscreen = not c.fullscreen
			c:raise()
		end,
		{description = "toggle fullscreen", group = "client"}),
	awful.key({ Modkey, "Shift"   }, "c",      function (c) c:kill()                         end,
			{description = "close", group = "client"}),
	awful.key({ Modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
			{description = "toggle floating", group = "client"}),
	awful.key({ Modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
			{description = "move to master", group = "client"}),
	awful.key({ Modkey,           }, "o",      function (c) c:move_to_screen()               end,
			{description = "move to screen", group = "client"}),
	awful.key({ Modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
			{description = "toggle keep on top", group = "client"}),
	awful.key({ Modkey,           }, "n",
		function (c)
			-- The client currently has the input focus, so it cannot be
			-- minimized, since minimized clients can't have the focus.
			c.minimized = true
		end ,
		{description = "minimize", group = "client"}),
	awful.key({ Modkey,           }, "m",
		function (c)
			c.maximized = not c.maximized
			c:raise()
		end ,
		{description = "(un)maximize", group = "client"}),
	awful.key({ Modkey, "Control" }, "m",
		function (c)
			c.maximized_vertical = not c.maximized_vertical
			c:raise()
		end ,
		{description = "(un)maximize vertically", group = "client"}),
	awful.key({ Modkey, "Shift"   }, "m",
		function (c)
			c.maximized_horizontal = not c.maximized_horizontal
			c:raise()
		end ,
		{description = "(un)maximize horizontally", group = "client"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
	global_keys = gears.table.join(global_keys,
		-- View tag only.
		awful.key({ Modkey }, "#" .. i + 9,
				function ()
						local screen = awful.screen.focused()
						local tag = screen.tags[i]
						if tag then
						 tag:view_only()
						end
				end,
				{description = "view tag #"..i, group = "tag"}),
		-- Toggle tag display.
		awful.key({ Modkey, "Control" }, "#" .. i + 9,
				function ()
					local screen = awful.screen.focused()
					local tag = screen.tags[i]
					if tag then
						 awful.tag.viewtoggle(tag)
					end
				end,
				{description = "toggle tag #" .. i, group = "tag"}),
		-- Move client to tag.
		awful.key({ Modkey, "Shift" }, "#" .. i + 9,
				function ()
					if client.focus then
						local tag = client.focus.screen.tags[i]
						if tag then
							client.focus:move_to_tag(tag)
						end
					 end
				end,
				{description = "move focused client to tag #"..i, group = "tag"}),
		-- Toggle tag on focused client.
		awful.key({ Modkey, "Control", "Shift" }, "#" .. i + 9,
				function ()
					if client.focus then
						local tag = client.focus.screen.tags[i]
						if tag then
							client.focus:toggle_tag(tag)
						end
					end
				end,
				{description = "toggle focused client on tag #" .. i, group = "tag"})
	)
end

local client_buttons = gears.table.join(
	awful.button({ }, 1, function (c)
		c:emit_signal("request::activate", "mouse_click", {raise = true})
	end),
	awful.button({ Modkey }, 1, function (c)
		c:emit_signal("request::activate", "mouse_click", {raise = true})
		awful.mouse.client.move(c)
	end),
	awful.button({ Modkey }, 3, function (c)
		c:emit_signal("request::activate", "mouse_click", {raise = true})
		awful.mouse.client.resize(c)
	end)
)

-- Set keys
root.keys(global_keys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
	-- All clients will match this rule.
	{
		rule = { },
		properties = {
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
			focus = awful.client.focus.filter,
			raise = true,
			keys = clientkeys,
			buttons = client_buttons,
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap+awful.placement.no_offscreen
		}
	},

	-- Floating clients.
	{
		rule_any = {
			instance = {
				"DTA",  -- Firefox addon DownThemAll.
				"copyq",  -- Includes session name in class.
				"pinentry",
			},
			class = {
				"Arandr",
				"Blueman-manager",
				"Gpick",
				"Kruler",
				"MessageWin",  -- kalarm.
				"Sxiv",
				"Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
				"Wpa_gui",
				"veromix",
				"xtightvncviewer"
			},

			-- Note that the name property shown in xprop might be set slightly after creation of the client
			-- and the name shown there might not match defined rules here.
			name = { "Event Tester" }, -- xev.
			role = {
				"AlarmWindow",  -- Thunderbird's calendar.
				"ConfigManager",  -- Thunderbird's about:config.
				"pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
			}
		},
		properties = { floating = true }
	},

	-- Add titlebars to normal clients and dialogs
	{
		rule_any = { type = { "normal" --[[ , "dialog" ]] }},
		properties = { titlebars_enabled = true }
	},

	-- Set Firefox to always map on the tag named "2" on screen 1.
	-- { rule = { class = "Firefox" },
	--   properties = { screen = 1, tag = "2" } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
	-- Set the windows at the slave,
	-- i.e. put it at the end of others instead of setting it master.
	-- if not awesome.startup then awful.client.setslave(c) end

	if awesome.startup
	and not c.size_hints.user_position
	and not c.size_hints.program_position then
		-- Prevent clients from being unreachable after screen count changes.
		awful.placement.no_offscreen(c)
	end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
	-- buttons for the titlebar
	local buttons = gears.table.join(
	awful.button({ }, 1,
		function()
		c: emit_signal("request::activate", "titlebar", {raise = true})
		awful.mouse.client.move(c)
		end
	),
		awful.button({ }, 3,
		function()
			c:emit_signal("request::activate", "titlebar", {raise = true})
			awful.mouse.client.resize(c)
		end
		)
	)

	awful.titlebar(c) : setup {
		{ -- Left
			awful.titlebar.widget.iconwidget(c),
			buttons = buttons,
			layout  = wibox.layout.fixed.horizontal
		},
		{ -- Middle
			{ -- Title
				align  = "center",
				widget = awful.titlebar.widget.titlewidget(c)
			},
			buttons = buttons,
			layout  = wibox.layout.flex.horizontal
		},
		{ -- Right
			awful.titlebar.widget.floatingbutton (c),
			awful.titlebar.widget.maximizedbutton(c),
			awful.titlebar.widget.stickybutton   (c),
			awful.titlebar.widget.ontopbutton    (c),
			awful.titlebar.widget.closebutton    (c),
			layout = wibox.layout.fixed.horizontal()
		},
		layout = wibox.layout.align.horizontal
	}
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
	c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

awful.util.spawn('picom --experimental-backends --backend glx')
