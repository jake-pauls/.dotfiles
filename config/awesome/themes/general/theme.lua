--[[

 Jake Pauls
 https://jakepauls.dev
 https://github.com/jake-pauls

 a subtle dark bar theme for awesome
 inspired and templated by https://github.com/lcpz/awesome-copycats

--]]

-- Imports and Declarations
local gears     = require("gears")
local lain      = require("lain")
local awful     = require("awful")
local wibox     = require("wibox")
local beautiful = require("beautiful")
local dpi       = beautiful.xresources.apply_dpi
local os        = os
local my_table  = awful.util.table or gears.table
local theme     = {}

-- Colors and Fonts
theme.confdir                                   = os.getenv("HOME") .. "/.config/awesome/themes/general"
theme.font                                      = "JetBrains Mono Nerd Font 6"

-- Dark Colors
theme.menu_bg_normal                            = "#181a1b"
theme.border_normal                             = "#181a1b"
theme.bg_normal                                 = "#181a1b"
theme.bg_urgent                                 = "#181a1b"

-- Light Colors
theme.menu_bg_focus                             = "#dbdbdb"
theme.fg_normal                                 = "#dbdbdb"
theme.fg_focus                                  = "#dbdbdb"
theme.border_focus                              = "#dbdbdb"
theme.menu_fg_normal                            = "#dbdbdb"
theme.menu_fg_focus                             = "#dbdbdb"
theme.fg_minimize                               = "#dbdbdb"

-- Matches Arch Launcher Color
theme.bg_focus                                  = "#474e5e"
theme.fg_urgent                                 = "#474e5e"

-- Icons
theme.arch_launcher                             = theme.confdir .. "/icons/arch.png"

-- Variables
theme.menu_width                                = dpi(130)
theme.border_width                              = dpi(0.5)
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.menu_border_width                         = 0
theme.useless_gap                               = 5

local markup = lain.util.markup

-- Textclock Config
os.setlocale(os.getenv("LANG")) -- to localize the clock
local clockicon = wibox.widget.imagebox(theme.widget_clock)
local mytextclock = wibox.widget.textclock(markup(theme.fg_focus, " %H:%M  ") .. markup(theme.fg_focus, " %m/%d/%y   "))
mytextclock.font = theme.font

function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal })

    -- Tags
    awful.tag(awful.util.tagnames, s, awful.layout.layouts)

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(my_table.join(
                           awful.button({}, 1, function () awful.layout.inc( 1) end),
                           awful.button({}, 2, function () awful.layout.set( awful.layout.layouts[1] ) end),
                           awful.button({}, 3, function () awful.layout.inc(-1) end),
                           awful.button({}, 4, function () awful.layout.inc( 1) end),
                           awful.button({}, 5, function () awful.layout.inc(-1) end)))

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.focused, awful.util.tasklist_buttons)

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height = dpi(16), bg = theme.bg_normal, fg = theme.fg_normal })

    -- Launcher
    local mylauncher = awful.widget.button({ image = theme.arch_launcher })
    local mylaunchermenu = awful.menu({
        items = {
            { "Restart", "reboot" },
            { "Shutdown", "poweroff" },
        }
    })
    mylauncher:connect_signal("button::press", function() mylaunchermenu:toggle() end)

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        expand = "none",
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            mylauncher,
            s.mytaglist,
            s.mypromptbox,
            s.mytasklist,
       },
        { -- Middle widgets
            layout = wibox.layout.fixed.horizontal,
            mytextclock,
        },
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.container.margin(wibox.widget.systray(), 5, 5, 5, 5),
       },

    }

end

return theme
