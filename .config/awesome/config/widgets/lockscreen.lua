--[[
    0xFELIX
    awesome is <3
    minimal lockscreen implimentation in awesome+lua 
--]]


local wibox = require 'wibox'
local awful = require 'awful'
local colors = require ('config.themes.' .. require 'config.vars'.theme .. '.colors')
local gears= require 'gears'

local _M = {}

_M.base = wibox {
  height = awful.screen.focused().geometry.height,
  width = awful.screen.focused().geometry.width,
  bg = colors.d,
  opacity = 1,
  shape = function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, 0)
  end,
  visible = false,
  ontop = true,
}

_M.textbox = wibox.widget {
  widget = wibox.widget.textbox
}

_M.base :setup {
  _M.textbox,
  layout = wibox.container.place,
  valign = 'center',
  halign = 'center',
}

awful.placement.centered (
  _M.base,
  {
    parent = awful.screen.focused()
  }
)

_M.lock = function()
  _M.base.visible = true
  awful.prompt.run {
    prompt = 'password: ',
    bg_cursor = colors.red,
    textbox = _M.textbox,
    exe_callback = function(password)
      if password == 'felix' then _M.base.visible = false
      else _M.lock() end
    end
  }
end 

return _M
