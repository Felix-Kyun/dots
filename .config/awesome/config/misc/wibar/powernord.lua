local awful = require 'awful'
local gears = require 'gears'
local wibox = require 'wibox'
local beautiful = require 'beautiful'

local tasklist = require 'config.misc.wibar.tasklist'
local taglist = require 'config.misc.wibar.taglist'
local clock = require 'config.misc.wibar.clock'
local battery = require 'config.misc.wibar.battery'
-- local battery_modern = require 'config.misc.wibar.battery-modern'
-- local music_icon = require 'config.misc.wibar.music_icon'
-- local music = require 'config.misc.wibar.mpd.wibar_widget'

awful.screen.connect_for_each_screen(function(s)
    awful.tag({ "  ", "  ", "  ", " 拾 ", " 漣 " }, s, awful.layout.layouts[1])

    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist
    }
    
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist
    }

    s.mywibox = awful.wibar({
      position = "top", 
      screen = s, 
      bg = beautiful.wibar_normal,
      visible = false,
      -- shape = function(cr, w, h)
      --   gears.shape.rounded_rect(cr, w, h, 10)
      -- end,
    })

    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
--            music,
            battery,
            wibox.widget.systray(),
            clock,
            s.mylayoutbox,
        },
    }
end) 

