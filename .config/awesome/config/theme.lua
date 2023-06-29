local beautiful = require 'beautiful'
local config_dir = require 'config.vars' .config_dir
local theme = require 'config.vars' .theme

beautiful.init(config_dir .. 'config/themes/' .. theme .. '/theme.lua')
