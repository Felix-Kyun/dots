local _M = {}

local wibox = require 'wibox'
local gears = require 'gears'

_M.bg = wibox.widget {
  widget = wibox.widget.imagebox,
  image = '/home/felix/.config/awesome/assets/qwe_download.png',
  height = 200,
  -- clip_shape = function(cr, width, height) gears.shape.rounded_rect(cr, width, height, 10) end,
  resize = true,
}

return _M
