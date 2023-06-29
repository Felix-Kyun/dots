local wibox = require 'wibox'
local awful = require 'awful'
local gears = require 'gears'
local colors = require 'helper.colors'
local rubato = require 'lib.rubato'
local parallel = require 'helper.rubato'.parallel_exec
local dpi = require 'beautiful.xresources'.apply_dpi

local _M = {}

_M.width = awful.screen.focused().geometry.width  * 3/10

_M.base = wibox {
  visible = false,
  ontop = true,
  height = awful.screen.focused().geometry.height - 100,
  width = _M.width,
  bg = colors.d2,
  shape = function(cr, width, height)
    gears.shape.partially_rounded_rect(cr, width, height, false, true, true, false, 20)
  end,
  border_width = 1,
  border_color = colors.b2,
}

awful.placement.left(
  _M.base,
  {
    parent = awful.screen.focused(),
    --[[ margins = {
      left = 10
    } ]]
  }
)

function _M.set_x(x)
  if x == -_M.width then _M.base.visible = false
  elseif x~= -_M.width then _M.base.visible = true
  end
  _M.base.x = x
end

function _M.togglev()
  _M.base.visible = not _M.base.visible
end

_M.show_base = rubato.timed {
  duration = 1/4,
  easing = rubato.quaratic,
  subscribed = function(x)
    _M.set_x(x - _M.width)
  end
}

function _M.toggle()
  if _M.base.visible then _M.show_base.target = 0
  elseif not _M.base.visible then _M.show_base.target = _M.width - _M.base.border_width
  end
end


_M.widgets = wibox.widget {
  layout = wibox.layout.fixed.vertical,
  {
    widget = wibox.layout.fixed.vertical,
    {
      widget = wibox.container.place,
      halign = 'center',
      require 'helper.cr_profile_box'(200, 'felix.jpg'),
    },
    {
      widget = wibox.container.place,
      halign = 'center',
      {
        widget = wibox.widget.textbox,
        text = 'Welcome, Felix',
        font = 'Fira Code Nerd Font 16'
      }
    }
  },
}
_M.base :setup {
  _M.widgets,
  layout = wibox.container.margin,
  top = 50
}

return _M
