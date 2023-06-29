-------------------------------------------------
-- Temperature widget
-------------------------------------------------

local wibox = require("wibox")  -- Provides the widgets
local watch = require("awful.widget.watch")  -- For periodic command execution

-- Create the text widget
local temp_text = wibox.widget{
    font = "Play 9",
    widget = wibox.widget.textbox,
}

-- Create the background widget
local temp_widget = wibox.widget.background()
temp_widget:set_widget(temp_text)

-- Set the base colors (will be immediately replaced)
temp_widget:set_bg("#008800")  -- Green background
temp_widget:set_fg("#ffffff")  -- White text

-- watch(
--   "acpi -t", 10,
--   function(_, stdout, stderr, exitreason, exitcode)
--     local temp = nil
--
--     -- This loop matches the groups number(s).number(s)
--     -- each pair is converted to a number and saved on `temp`
--     -- (Only the last group is kept)
--     for str in string.gmatch(stdout, "([0-9]+.[0-9]+)") do
--       temp = tonumber(str)
--     end
--
--     -- Set that as text (not just the raw command)
--     temp_text:set_text(" " .. temp .. "ºC ")
--
--     -- Set colors depending on the temperature
--     if (temp < 70) then
--       temp_widget:set_bg("#008800")
--       temp_widget:set_fg("#ffffff")
--     elseif (temp < 80) then
--       temp_widget:set_bg("#AB7300")
--       temp_widget:set_fg("#ffffff")
--       was_down = true
--     else
--       temp_widget:set_bg("#880000")
--       temp_widget:set_fg("#ffffff")
--       was_down = true
--     end
--
--     -- Launch the garbage collector, this only has to be on one
--     -- widget (no problem if there's more though).
--     -- See: https://github.com/awesomeWM/awesome/issues/2858#issuecomment-980489840
--     collectgarbage()
--
--   end,
--   temp_widget
-- )

watch('date', 10, function(_, stdout) temp_text:set_text(stdout) end, temp_widget)

temp_text:set_text(" ??? ")

-- Export the widget
return temp_widget
