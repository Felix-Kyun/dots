-- morderinzed battery widget 

local wibox = require 'wibox'
local gears = require 'gears'
local awful = require 'awful'
local naughty = require 'naughty'
local colors = re:quire ('config.themes.' .. require 'config.vars'.theme .. '.colors')

local widget = wibox.widget {
  {
    widget = wibox.widget.textbox,
    text = '100%',
    id = 'text'
  },
  {
    widget = wibox.widget.progressbar,
    min_value = 0,
    max_value = 100,
    forced_width = 50,
    paddings = 1,
    value = 0,
    id = 'bar',
    padding = 2,
  },
  layout = wibox.layout.stack,
  set_battery = function(self, level)
    self.text.text = tostring(level .. '%')
    self.bar.value = tonumber(level)
  end
}

gears.timer{
  timeout = 10,
  call_now = true,
  autostart = true,
  callback = function()
    awful.spawn.easy_async(
    {'/home/felix/.local/bin/battery'},
    function(stdout)
      naughty.notify { text = '-->> ' .. stdout, timeout = 5, title = 'battery-modern_info'}
      widget:set_battery(stdout)
    end
    )
  end
}

return widget
