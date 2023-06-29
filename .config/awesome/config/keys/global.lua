local gears = require 'gears'
local awful = require 'awful'
local modkey = require 'config.vars' . modkey
local m = { modkey }
local ms = { modkey, "Shift" }
local mc = { modkey, 'Control' }
local mcs = { modkey, 'Shift', 'Control' }

local _M = {}

local keydata = {
  {m,  'Escape',awful.tag.history.restore},
  {m,  'Tab',   function() awful.client.focus.byidx(1) end },
  {ms, 'Tab',   function () awful.client.swap.byidx(1) end },
  {m,  'u',     awful.client.urgent.jumpto },
  {mc, 'Tab',   function() awful.screen.focus_relative(1) end },
  {m,  'r',     awesome.restart },
  {ms, 'c',     awesome.quit },
  {m,  'space', function() awful.layout.inc(1) end },
  {ms, 'space', function() awful.layout.inc(-1) end },
  {m,  'h',     function() awful.tag.incmwfact(-0.05) end },
  {m,  'l',     function() awful.tag.incmwfact(0.05) end },
  {mc, 'j',     function () awful.tag.incnmaster(-1, nil, true) end},
  {mc, 'k',     function () awful.tag.incnmaster(1, nil, true) end},
  {mc, 'h',     function () awful.tag.incncol(-1, nil, true) end},
  {mc, 'l',     function () awful.tag.incncol(1, nil, true) end},
  {mc, 'n',     function()
    local c = awful.client.restore()
    if c then 
      c:emit_signal(
        "request::activate", "key.minimize", {raise = true}
      )
    end
  end},
  -- {},
}

for _, v in pairs(keydata) do _M = gears.table.join(_M, awful.key(table.unpack(v))) end

-- window manager tweaks

for i = 1, 5 do 
  _M = gears.table.join(_M, 

    awful.key(m, i,
      function()
        local tag = awful.screen.focused().tags[i]
        if tag then tag:view_only() end 
      end
    ),

    awful.key(ms, i,
    function() 
      if client.focus then 
        local tag = client.focus.screen.tags[i]
        if tag then client.focus:move_to_tag(tag) end
      end
    end),

    awful.key(mc, i,
      function ()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then awful.tag.viewtoggle(tag) end
      end
    ),

    awful.key(mcs, i,
    function ()
      if client.focus then
          local tag = client.focus.screen.tags[i]
          if tag then
              client.focus:toggle_tag(tag)
          end
      end
    end))
end

_M = gears.table.join(_M, require 'config.keys.user', require 'config.keys.function')

root.keys(_M)
