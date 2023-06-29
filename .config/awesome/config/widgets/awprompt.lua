local wibox = require 'wibox'
local awful = require 'awful'
local gears = require 'gears'
local rubato = require 'lib.rubato'
local dpi = require 'beautiful.xresources'.apply_dpi
local colors = require 'helper.colors'


local _M = {}

_M.textbox = wibox.widget {
  widget = wibox.widget.textbox,
  text = ''
}

function _M:set_text(text)
  _M.textbox.text = text 
end

_M.prompt = awful.popup {
  widget = {
    widget = wibox.container.background,
    {
      widget = wibox.container.margin,
      _M.textbox,
      margins = dpi(10)
    },
    bg = colors.d1
  },
  visible = true,
  shape = function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, 10)
  end,
  placement = awful.placement.centered,
  ontop = true,
  border_color = colors.green,
  border_width = 1
}

_M.misc_func = function(input) 
  _M.prompt.visible = false 
  if string.sub(tostring(input), 1, 1) == '/' then
    awful.util.eval(string.sub(tostring(input), 2, #input))
  elseif string.sub(tostring(input), 1, 1) == '.' then
    awful.util.spawn(string.sub(tostring(input), 2, #input))
  elseif input ~= '' then
    awful.util.spawn('kitty -e ' .. input)
  end
end

_M.run = function()
  _M.prompt.visible = true
  awful.prompt.run {
    prompt = 'run lua code: ',
    textbox = _M.textbox,
    exe_callback = _M.misc_func,
    history_path = awful.util.get_cache_dir() .. '/history_eval',
  }
end

return _M
