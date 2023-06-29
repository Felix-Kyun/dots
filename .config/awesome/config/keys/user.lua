local gears = require 'gears'
local awful = require 'awful'
local music_widget = require 'config.misc.wibar.mpd.music'
local modkey = require 'config.vars' . modkey
local bin = require 'config.vars' .bin
local m = { modkey }
local s = { 'Shift' }
local ms = { modkey, s[1] }
local machi = require 'layout-machi'
local lockscreen = require 'config.widgets.lockscreen.lockscreen'
local sidebar = require 'config.widgets.test_sidebar'

function e(app) 
  return function() 
    awful.spawn(app)
  end
end

function ex(app) 
  return function() 
    awful.spawn.with_shell(app)
  end
end

local _M = {}

local keydata = {
  {m,  'Return', e('kitty') },
  {m,  'b', ex(bin .. 'batt') },
  {{}, 'Print', e(bin .. 'ss full') },
  {s,  'Print', e(bin .. 'ss crop') },
  {{}, 'XF86AudioPause', e'playerctl play-pause' },
  {{}, 'XF86AudioPlay', e'playerctl play-pause' },
  {m,  'p', e(bin .. 'out') },
  {ms, 'Return', e(bin .. 'launcher') },
  {m,  'BackSpace', e(bin .. 'powermenu') },
  {ms, 'm', e(bin .. 'mpdmenu') },
  {m, '.', function() machi.default_editor.start_interactive() end },
  {m, '/', function() machi.switcher.start(client.focus) end },
  {m, '\\', function() music_widget.visible = not music_widget.visible end},
  {m,  'x', function() require 'config.widgets.awprompt'.run() end },
  {m, ';', function() lockscreen.lock() end},
  {m, "'", function() sidebar.toggle() end },
  {{'Mod1'}, 'Tab', e'rofi -show window'},
  {m, 'z', e'rofi-bluetooth' },
}

for _, v in pairs(keydata) do _M = gears.table.join(_M, awful.key(table.unpack(v))) end

return _M
