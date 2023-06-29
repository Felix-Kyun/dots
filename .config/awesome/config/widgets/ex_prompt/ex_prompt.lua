local awful = require 'awful'

awful.screen.connect_for_each_screen(function(s)
  s.prompt = awful.widget.prompt()
end)
