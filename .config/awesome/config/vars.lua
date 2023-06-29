local os = require 'os'
local user = os.getenv 'USER'

local _M = {
  modkey = 'Mod4',
  config_dir = '/home/' .. user .. '/.config/awesome/',
  theme = 'nord',
  bin = '/home/' .. user .. '/.local/bin/',
  wi_theme = 'powernord'
}

return _M
