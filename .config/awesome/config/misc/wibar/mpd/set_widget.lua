local base = require 'config.misc.wibar.mpd.music'
local wibox = require 'wibox'
local naughty = require 'naughty'
local mk = require 'config.misc.wibar.mpd.mk_buttons'
local watch = require 'awful.widget.watch'
local mpc = require 'config.misc.wibar.mpd.mpc'
local colors = require ('config.themes.' .. require 'config.vars'.theme .. '.colors')

local _M = {}

_M.now_playing = mk.text (
  'not_updated!',
  'text'
  )

_M.volume = mk.text (
  'not_updated!',
  'volume'
)

_M.progress = mk.text(
  'not_updated!',
  'progress'
)

function _M.refresh()
    mpc:refresh()
    _M.now_playing :set_text(mpc.now_playing)
    _M.volume :set_text(mpc.volume)
    _M.progress :set_text(mpc.progress_time)
end

_M.prev = mk.mk_button_simple (
  '󰒮 ',
  'prev',
  'playing previous song',
  'prev',
  18,
  _M.refresh
)

_M.next = mk.mk_button_simple (
  '󰒭 ',
  'next',
  'playing next song',
  'prev',
  18,
  _M.refresh
)

_M.vol_up = mk.mk_button_simple(
  '󰝝 ',
  'vol_up',
  'increased volume',
  'volume +5',
  18,
  _M.refresh
)

_M.vol_down = mk.mk_button_simple (
  '󰝞 ',
  'vol_down',
  'decreased volume',
  'volume -5',
  18,
  _M.refresh
)

_M.forward = mk.mk_button_simple (
  '󱇸 ',
  'forward',
  'forwarded 5 seconds',
  'seek +5',
  18,
  _M.refresh
)

_M.rewind = mk.mk_button_simple (
  '󱇹 ',
  'rewind',
  'rewinded 5 seconds',
  'seek -5',
  18,
  _M.refresh
)

_M.repeat_ = mk.colored_button (
  '󰑖 ',
  'repeat',
  'repeat',
  14,
  colors.green,
  colors.red,
  _M.refresh
)

_M.random = mk.colored_button (
  ' ',
  'random',
  'random',
  14,
  colors.green,
  colors.red,
  _M.refresh
)

_M.single = mk.colored_button (
  '󰑘 ',
  'single',
  'single',
  14,
  colors.green,
  colors.red,
  _M.refresh
)

_M.playback_toggle = mk.alt_text(
  ' ',
  ' ',
  'playing',
  'paused',
  'toggle',
  _M.refresh,
  'status',
  'playback togled',
  18
)

-- _M.now_playing:set_text('hello')

base :setup {
  {
    _M.now_playing,
    {
      _M.prev,
      _M.playback_toggle,
      _M.next,
      widget = wibox.layout.flex.horizontal,
      spacing = 10,
    },
    {
      _M.vol_down,
      _M.volume,
      _M.vol_up,
      widget = wibox.layout.flex.horizontal,
      spacing = 10,
    },
    {
      _M.rewind,
      _M.progress,
      _M.forward,
      widget = wibox.layout.flex.horizontal,
      spacing = 10,
    },
    {
      _M.repeat_,
      _M.random,
      _M.single,
      widget = wibox.layout.flex.horizontal,
      spacing = 10,
    },
    widget = wibox.layout.flex.vertical,
    spacing = 15
  },
  layout = wibox.container.margin,
  margins = 20
}



watch(
  'echo',
  1,
  function()
    if base.visible then 
      _M.refresh()
    end
    collectgarbage()
  end
)
