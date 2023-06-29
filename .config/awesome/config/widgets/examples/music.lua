-- music test widget 
local wibox = require 'wibox'
local gears = require 'gears'
local awful = require 'awful'
-- local naughty = require 'naughty'
local colors = require ('config.themes.' .. require 'config.vars'.theme .. '.colors')

local play_pause_toggle = wibox.widget {
  {
    {
    {
      text = 'play',
      id = 'toggle',
      widget = wibox.widget.textbox,
    },
    id = 'lv2',
    top =8, bottom =8, right=8, left=8,
    widget = wibox.container.margin,
    },
    id = 'lv1',
    widget = wibox.container.place,
    halign = 'center',
  },
  widget = wibox.container.background,
  shape = function (cr, width, height) gears.shape.rounded_rect(cr, width, height, 5) end,
  shape_border_width = 1,
  shape_border_color = colors.b2,
  set_text = function(self,value)
    self.lv1.lv2.toggle.text = value
  end,
  get_text = function()
    return self.lv1.lv2.toggle.text 
  end
  }

  play_pause_toggle :connect_signal('button::press',
  function() 
    awful.spawn.easy_async(
    {"/home/felix/.local/bin/mpc_status"},
    function(stdout)
      play_pause_toggle:set_text(stdout)
    end
    )
  end
  )



local music = wibox.widget {
  play_pause_toggle,
  spacing = 10,
  layout = wibox.layout.flex.horizontal,
}

local base = wibox {
  visible = true,
  bg = colors.d1,
  height = 100,
  width =300,
  shape = function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, 0)
  end
}

base :setup {
  music,
  valign = 'center',
  layout = wibox.container.place
}

awful.placement.centered(base, { parent = awful.screen.focused()})
