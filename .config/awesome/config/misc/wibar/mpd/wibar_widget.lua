local wibox = require 'wibox'
local base = require 'config.misc.wibar.mpd.music'

local widget = wibox.widget {
  {
    widget = wibox.widget.textbox,
    text = 'music',
    font = 'Fira Code Nerd Font 9',
    id = 'wibar_music_widget',
  },
  widget = wibox.container.margin,
  left = 5, right = 5,
}

require 'config.misc.wibar.mpd.set_widget'

widget :connect_signal(
  'button::press',
  function(c)
    base.visible = not base.visible
  end
)

return widget
