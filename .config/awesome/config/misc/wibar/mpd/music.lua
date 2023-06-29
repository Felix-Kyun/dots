local wibox = require 'wibox'
local awful = require 'awful'
local gears = require 'gears'
local colors = require ('config.themes.' .. require 'config.vars'.theme .. '.colors')


base = wibox {
  visible = false, 
  ontop = true,
  bg = colors.d1,
  height = 500,
  width = 750,
  border_width = 2,
  border_color = colors.b2,
  shape = function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, 10)
  end,
}

awful.placement.centered(
  base,
  {
    parent = awful.screen.focused(),
    {
      --[[ margins = {
        top = 0,
        right = 0,
      } ]]
    }
  }
)

return base
