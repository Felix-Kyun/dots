local awful = require 'awful'

return function() 
  awful.prompt.run{
   prompt = 'lua code -> ',
   textbox = awful.screen.focused().prompt.widget,
   exe_callback = awful.util.eval,
   history_path = awful.util.get_cache_dir() .. '/history_eval',
 }
end
