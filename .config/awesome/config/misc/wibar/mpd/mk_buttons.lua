local wibox = require 'wibox'
local gears = require 'gears'
local awful = require 'awful'
local naughty = require 'naughty'
local colors = require ('config.themes.' .. require 'config.vars'.theme .. '.colors')
local mpc = require 'config.misc.wibar.mpd.mpc'
local func = {}


--[[
  example use of mk_button_simple(
  icon-> any text that will used a icon for the textbox,
  id -> id for the widget,
  notify -> the message to notify when the button is clicked,
  on_click -> the mpc command to execute when the button is clicked
  )
--]]
function func.mk_button_simple(icon, id, notify, on_click, font_size, refresh)
  local widget = wibox.widget {
    {
      {
        {
          widget = wibox.widget.textbox,
          font = 'Fira Code Nerd Font ' .. tostring(font_size),
          text = icon,
          id = id

        },
        widget = wibox.container.margin,
        margins = 10,
      },
      widget = wibox.container.place,
      halign = 'center',
    },
    widget = wibox.container.background,
    bg = colors.d1,
    shape = function(cr, width, height)
      gears.shape.rounded_rect(cr, width, height, 5)
    end,
    shape_border_width = 2,
    shape_border_color = colors.b2,
  }

  widget :connect_signal (
    'button::press',
    function()
      os.execute('mpc -q ' .. on_click)
      naughty.notify {
        text = notify,
      }
      refresh()
    end
  )
  return widget
end

function func.text(content, id)
  local widget = wibox.widget {
    {
      {
        {
          widget = wibox.widget.textbox,
          font = 'Fira Code Nerd Font 10',
          text = content,
          id = 'text'

        },
        widget = wibox.container.margin,
        margins = 10,
        id = 'margin'
      },
      widget = wibox.container.place,
      halign = 'center',
      id = 'place'
    },
    widget = wibox.container.background,
    bg = colors.d1,
    shape = function(cr, width, height)
      gears.shape.rounded_rect(cr, width, height, 5)
    end,
    shape_border_width = 2,
    shape_border_color = colors.b2,
    set_text = function(self, text) self.place.margin.text.text = text end
  }

  return widget 
end

function func.colored_button(icon, id, command, font_size, true_fg, false_fg, refresh)
  local widget = wibox.widget {
    {
      {
        {
          widget = wibox.widget.textbox,
          font = 'Fira Code Nerd Font ' .. tostring(font_size),
          text = icon,
          id = id

        },
        widget = wibox.container.margin,
        margins = 10,
      },
      widget = wibox.container.place,
      halign = 'center',
    },
    widget = wibox.container.background,
    bg = colors.d1,
    shape = function(cr, width, height)
      gears.shape.rounded_rect(cr, width, height, 5)
    end,
    shape_border_width = 2,
    shape_border_color = colors.b2,
    fg = colors.l1,
    mode = true,
    _get_fg = function(self) return tostring(self.fg) end,
    _set_fg = function(self, fg_color) self.fg = fg_color end,
  }

  mpc:refresh()
  if mpc['on_' .. id] == 'on' then widget.fg = true_fg; widget.mode = true 
  elseif mpc['on_' .. id] == 'off' then widget.fg = false_fg; widget.mode = false
  end

  widget :connect_signal(
  'button::press',
  function()
    os.execute('mpc -q ' .. command)
    refresh()
    if widget.mode then widget.fg = false_fg; widget.mode = false
    elseif not widget.mode then widget.fg = true_fg; widget.mode = true
    end
    naughty.notify {
      text = 'turned ' .. mpc['on_' .. id] .. ' ' .. id
    }
  end
  )

  return widget
end

function func.alt_text(content_1, content_2, content_1_check, content_2_check, cmd, refresh, mpc_id, notify_text, font_size)
  local widget = wibox.widget {
    {
      {
        {
          widget = wibox.widget.textbox,
          font = 'Fira Code Nerd Font ' .. tostring(font_size),
          text = content_1,
          id = 'text'

        },
        widget = wibox.container.margin,
        margins = 10,
        id = 'margin'
      },
      widget = wibox.container.place,
      halign = 'center',
      id = 'place'
    },
    widget = wibox.container.background,
    bg = colors.d1,
    shape = function(cr, width, height)
      gears.shape.rounded_rect(cr, width, height, 5)
    end,
    shape_border_width = 2,
    shape_border_color = colors.b2,
    set_text = function(self, text) self.place.margin.text.text = text end
  }

  mpc:refresh()
  if mpc[mpc_id] == content_1_check then widget:set_text(content_2)
  elseif mpc[mpc_id] == content_2_check then widget :set_text(content_1)
  end

  function widget:refresh()
    if mpc[mpc_id] == content_1_check then widget:set_text(content_2)
    elseif mpc[mpc_id] == content_2_check then widget :set_text(content_1)
    end
  end


  widget :connect_signal('button::press',
    function()
      os.execute('mpc -q ' .. cmd)
      refresh()
      if mpc[mpc_id] == content_1_check then widget:set_text(content_2)
      elseif mpc[mpc_id] == content_2_check then widget :set_text(content_1)
      end
      naughty.notify {
        text = notify_text,
      }
    end
  )

  return widget 
end


return func
