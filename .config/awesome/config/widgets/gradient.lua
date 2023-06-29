local wibox = require 'wibox'
local gears = require 'gears'
local awful = require 'awful'

local screen = awful.screen.focused().geometry

local base = wibox {
  visible = true,
  ontop = true,
  height = screen.height,
  width = 600,
  -- bg = '#999999',
  shape = function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, 25)
  end,
  bg =  gears.color{
    type = 'linear',
    from = { 0, 0 },
    to = { 600, screen.height },
    stops = {
      { 0, '#bdc3c7' },
      { 1, '#2c3e50' },
    }
  }
}

awful.placement.left(
  base,
  {
    parent = awful.screen.focused(),
  }
)
