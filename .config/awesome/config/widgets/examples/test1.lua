local wibox = require 'wibox'
local gears = require 'gears'
local awful = require 'awful'
local colors = require ('config.themes.' .. require 'config.vars'.theme .. '.colors')

local base = wibox {
  visible = true,
  bg = colors.d1,
  height = 500,
  width = 1000,
  shape = function (cr, width, height)
    gears.shape.rounded_rect(cr, width, height, 0)
  end
}


local button1 = wibox.widget {
  text = 'click me!',
  widget = wibox.widget.textbox
}

local button2 = wibox.widget {
  {
    {
      image = '/home/felix/Downloads/default.png',
      resize = true,
      forced_size = 20,
      widget = wibox.widget.imagebox
    },
    margins = 4,
    widget = wibox.container.margin,
  },
  {
    {
      text = 'click me!',
      widget = wibox.widget.textbox,
    },
    top = 4, bottom = 4, right = 8,
    widget = wibox.container.margin,
  },
  layout = wibox.layout.align.horizontal,
}

local button3 = wibox.widget {
  {
    {
      text = 'click me!',
      widget = wibox.widget.textbox,
    },
    top = 4, bottom =4, right = 4, left = 4,
    widget = wibox.container.margin,
  },
  widget = wibox.container.background,
  shape = function (cr, width, height) gears.shape.rounded_rect(cr, width, height, 5) end,
  shape_border_width = 1,
  shape_border_color = colors.b2,
}

button3 :connect_signal('mouse::enter', function(c) c:set_fg(colors.red) end)
button3 :connect_signal('mouse::leave', function(c) c:set_fg(colors.l1) end)

button3 :connect_signal('button::press', function(c) base.visible = false end)
button3 :connect_signal('button::release', function(c) c:set_bg(colors.d1) end)




base :setup {
  -- button1,
  -- button2,
  button3,
  valign = 'center',
  layout = wibox.container.place
}

awful.placement.centered(base, {parent = awful.screen.focused()})
