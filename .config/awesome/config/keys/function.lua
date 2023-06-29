local gears = require 'gears'
local awful = require 'awful'
local _M = {}
local m = { require 'config.vars' .modkey }
local e = {}
local s = { 'Shift' }
local brightness = require 'helper.misc.brightness'

function ex(app) 
  return function() 
    awful.spawn(app)
  end
end

local keydata = {
  {e, 'XF86MonBrightnessDown', function() brightness:dec(5) end },
  {e, 'XF86MonBrightnessUp', function() brightness:inc(5) end },
  {e, 'XF86AudioPrev', ex'mpc prev' },
  {e, 'XF86AudioNext', ex'mpc next' },
  {s, 'F10', ex'mpc toggle' },
  {e, 'XF86AudioLowerVolume', ex'amixer sset Master 5%-' },
  {e, 'XF86AudioRaiseVolume', ex'amixer sset Master 5%+' },
  {s, 'F7', ex'mpc volume -5' },
  {s, 'F8', ex'mpc volume +5' },
  {e, 'XF86AudioMute', ex'amixer sset Master toggle' }
}

for _, v in pairs(keydata) do _M = gears.table.join(_M, awful.key(table.unpack(v))) end

return _M
