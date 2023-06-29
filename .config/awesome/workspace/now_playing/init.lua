local wibox = require 'wibox'
local colors = require 'helper.colors'
local gears = require 'gears'
local awful = require 'awful'

local base = wibox {
  bg = colors.d2,
  shape = function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, 10)
  end,
  height = 500,
  width = 700,
  visible = true,
  ontop = false,
}

local base_box = wibox.widget {
  homogeneous = true,
  -- spacing = 0,
  forced_num_cols = 7,
  forced_num_rows = 5,
  min_cols_size = 100,
  min_rows_size = 100,
  layout = wibox.layout.grid,
}

base :setup{
  layout = wibox.layout.stack,
  base_box,
}

awful.placement.centered(
  base,
  {
    parent = awful.screen.focused()
  }
)

local now_layout = wibox.widget {
  widget = wibox.layout.grid,
  forced_num_rows = 6,
  forced_num_cols = 20,
  min_rows_size = 50,
  min_cols_size = 25,
  homogeneous = true,
}

local bg = wibox.widget {
  widget = wibox.widget.background,
  bg = colors.d,
  width = 100,
  shape = function(cr, width, height) 
    gears.shape.rounded_rect(cr, width, height, 10)
  end,
  {
    widget = wibox.container.place,
    valign = 'center',
    halign = 'center',
    now_layout,
  }
}

local thumbnail = wibox.widget {
  widget = wibox.widget.imagebox,
  image = '/home/felix/.config/awesome/assets/felix.jpg',
  forced_height = 120,
  forced_width = 150,
  resize = true,
}

local thumbnail_box = wibox.widget {
  widget = wibox.widget.background,
  width = 150,
  shape = function(cr, width, height) gears.shape.rounded_rect(cr, width, 100, 10) end,
  bg = colors.b1,
  shape_clip = true, 
  thumbnail,
}
 now_layout :add_widget_at(thumbnail_box, 2, 2, 2, 6)

base_box :add_widget_at(bg, 2, 2, 3, 5)

