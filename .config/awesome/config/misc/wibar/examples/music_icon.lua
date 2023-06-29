local wibox = require 'wibox'
local gears = require 'gears'
local awful = require 'awful'
local naughty = require 'naughty'
local colors = require ('config.themes.' .. require 'config.vars'.theme .. '.colors')
local mpc = require 'config.widgets.music.mpc'

function make_textbox(content, widget_id, on_click)
  local widgeta_v1 =  wibox.widget {
    widget = wibox.widget.textbox,
    text = content,
    id = widget_id,
  }
   local widget_v2 = wibox.widget {
     {
     {
       {
         widget = wibox.widget.textbox,
         font = 'FiraCode Nerd Font 18',
         text = content,
         id = widget_id,
       },
       widget = wibox.container.margin,
       margins = 10,
     },
     widget = wibox.container.place,
     halign = 'center'
     },
     widget = wibox.container.background,
     forced_width = 200,
     forced_height = 100,
     bg = colors.d1,
     shape = function(cr, width, height)
       gears.shape.rounded_rect(cr, width, height, 5)
     end,
     shape_border_width = 2,
     shape_border_color = colors.b2
   }
  widget_v2 :connect_signal('button::press', on_click)
  return widget_v2
end

local widget = wibox.widget {
  widget = wibox.widget.textbox,
  font = 'Fira Code Nerd Font 9',
  text = ' music ',
  id = 'widget'
}

local music_box = wibox.widget {
  make_textbox('󰒮 ', 'prev', mpc:get_callback('prev')),
  make_textbox(' /  ', 'toggle', mpc:get_callback('toggle')),
  make_textbox('󰒭 ', 'next', mpc:get_callback('next')),
  layout = wibox.layout.flex.horizontal,
  spacing = 10,
}

local music_box_bg = wibox {
  ontop = true,
  visible = false,
  bg = colors.d1,
  height = 250,
  width = 750,
  shape = function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, 10)
  end,
  border_width = 2,
  border_color = colors.b2,
}


music_box_bg :setup {
  music_box,
  valign = 'center',
  layout = wibox.container.place,
}

awful.placement.centered(music_box_bg, {parent = awful.screen.focused(), margins = {top = 50, right = 50}})

widget :connect_signal('button::press', function(c)
  music_box_bg.visible = not music_box_bg.visible ,
  naughty.notify({
    text = 'button pressed!',
  })
end)

return widget
