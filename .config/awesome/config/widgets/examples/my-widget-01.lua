local wibox = require "wibox"
local watch = require "awful.widget.watch"

local txt = wibox.widget {
  font = "Fira Code NerdFont 9",
  widget = wibox.widget.textbox,
}

local bg = wibox.widget.background()
bg:set_widget(txt)

bg:set_bg "#008800"
bg:set_fg "#ffffff"

watch(
  "acpi | cut -d' '  -f4 | sed 's/,//'"
)

return bg
