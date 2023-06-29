local wibox = require 'wibox'
local gears = require 'gears'
local colors = require 'helper.colors'

return function(size, image_file_name)
  return wibox.widget {
  widget = wibox.container.place,
  halign = 'center',
  {
    widget = wibox.container.background,
    bg = colors.d3 .. '00',
    shape = function(cr)
      gears.shape.rounded_bar(cr, size +10, size +10)
    end,
    shape_border_width = 2,
    shape_border_color = colors.b2,
    {
      widget = wibox.container.margin,
      margins = 5,
      {
        widget = wibox.widget.imagebox,
        image = '/home/felix/.config/awesome/assets/' .. image_file_name,
        forced_height = size +22,
        clip_shape = function(cr)
          gears.shape.rounded_bar(cr, size, size)
        end
      }
    }
  }
}
end 
