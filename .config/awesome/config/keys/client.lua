local gears = require 'gears'
local awful = require 'awful'
local modkey = require 'config.vars' . modkey
local m = { modkey }
local ms = { modkey, "Shift" }
local mc = { modkey, 'Control' }
-- local mcs = { modkey, 'Shift', 'Control' }

local _M = {}

local keydata = {
  {m, 'f', function(c)
    c.fullscreen = not c.fullscreen
    c:raise()
  end
  },
  {m, 'q', function(c) c:kill() end },
  {m, 'space', awful.client.floating.toggle },
  {mc, 'Return', function(c) c:swap(awful.client.getmaster()) end },
  {m, 't', function(c) c.ontop = not c.ontop end },
  {m, 'n', function(c) c.minimized = true end },
  {m, 'm', function(c) c.maximized = not c.maximized; c:raise() end },
}

for _, v in pairs(keydata) do _M = gears.table.join(_M, awful.key(table.unpack(v))) end

return _M
