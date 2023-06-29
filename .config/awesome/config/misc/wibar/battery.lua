-- wibox module for shiwing battery percentage 

local wibox = require 'wibox'
local watch = require 'awful.widget.watch'
local colors = require ('config.themes.' .. require 'config.vars'.theme .. '.colors')

-- color definations
local fore = colors.l1
local full = colors.green
local norm = colors.d1
local low = colors.orange
local err = colors.red


local command = "/home/felix/.local/bin/battery"

local text_box = wibox.widget{
  font = 'Fira Code Nerd Font 9',
  widget = wibox.widget.textbox,
}

local widget = wibox.container.background()
widget:set_widget(text_box)

widget:set_bg(norm)
widget:set_fg(fore)


function battery (_, stdout)
  local percent = tonumber(stdout)
  text_box:set_text(' ' .. percent .. '% ')
  if percent > 90 then widget:set_bg(full)
  elseif percent < 20 then widget:set_bg(low)
  else widget:set_bg(norm) end
  collectgarbage()
end


watch(
  command,
  10,
  battery,
  widget
)

widget:set_bg(err)
text_box:set_text '???'

return widget
