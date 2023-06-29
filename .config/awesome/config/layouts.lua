local awful = require 'awful'
require 'awful.autofocus'

-- addition config for machi layout
local machi = require 'layout-machi'
local beautiful = require 'beautiful'
beautiful.layout_machi = machi.get_icon()

--[[
  All Layouts:
    - folating
    - tile (left, bottom, top)
    - fair (horizontal)
    - spiral (dwindle)
    - max (fullscreen)
    - magnifier
    - corner.nw (ne, sw, se)

    for enabling prefix with `awful.layouts.suit`
--]]

awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.floating,
    machi.default_layout,
    awful.layout.suit.spiral,
}
