local wibox = require 'wibox'
local awful = require 'awful'
local gears = require 'gears'
local rubato = require 'lib.rubato'
local parallel = require 'helper.rubato'.parallel_exec

local _M = {}

_M.base = wibox {
  bg = '#999999',
  shape = function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, 10)
  end,
  height = 250,
  width = 250,
  visible = false,
  ontop = true
}

_M.base_anim = rubato.timed {
  pos = 0,
  rate = 10,
  intro = 0.3,
  easing = rubato.quadratic,
}

_M.base_anim:subscribe(
  function (pos)
    parallel(
    pos,
    {function(y) _M.base.x = y end, 0, _M.base.x},
    {function(y) _M.base.opacity = y end, 0, 100}
    )
  end
)

_M.show_base = function()
  _M.base.visible = true
  _M.base_anim.target = 100
end

_M.base :connect_signal(
  'button::press',
  function()
    _M.base.visible = false
  end
)

awful.placement.centered(
  _M.base,
  {
    parent = awful.screen.focused(),
  }
)
return _M
