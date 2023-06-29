local wibox = require 'wibox'
local awful = require 'awful'
local gears = require 'gears'
local colors = require ('config.themes.' .. require 'config.vars'.theme .. '.colors')

local _M = {}

_M.prompt_shell = wibox {
  visible = true,
  bg = colors.d1,
  ontop = true,
  height = 100,
  width = 400,
  border_width = 1,
  border_color = colors.green,
  shape = function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, 5)
  end,
}

_M.textbox = wibox.widget {
  widget = wibox.widget.textbox,
  text = 'test',
}

_M.base_widget = wibox.widget {
  {
    {
      _M.textbox,
      widget = wibox.container.margin,
      margins = 20,
    },
    widget = wibox.container.background,
    shape = function(cr, width, height)
      gears.shape.rounded_rect(cr, width, height, 5)
    end,
    bg = colors.d,
    id = 'textbox_border',
    -- opacity = 1,
  },
  widget = wibox.container.margin,
  margins = 10,
}

_M.prompt_shell:setup {
  _M.base_widget,
  layout = wibox.container.place,
  valign = 'center'
}

awful.placement.centered(
  _M.prompt_shell,
  {
    parent = awful.screen.focused(),
  }
)

_M.prompt = function()
  awful.prompt.run {
    prompt = 'run lua code: ',
    textbox = _M.textbox,
    exe_callback = awful.util.eval,
    history_path = awful.util.get_cache_dir() .. "/history_eval"
  }
end

return _M
