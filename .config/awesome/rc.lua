--[[
 *      ______     ___         __ __                
 *     / ____/__  / (_)  __   / //_/_  ____  ______ 
 *    / /_  / _ \/ / / |/_/  / ,< / / / / / / / __ \
 *   / __/ /  __/ / />  <   / /| / /_/ / /_/ / / / /
 *  /_/    \___/_/_/_/|_|  /_/ |_\__, /\__,_/_/ /_/ 
 *                              /____/              
 *                 @Felix-Kyun
 *               Felix Kyun#3934
--]]

pcall(require, "luarocks.loader")

-- handle startup errors 
require 'config.error'

-- load theme
require 'config.theme'

-- load layouts
require 'config.layouts'

-- load wibar
require 'config.wibar'

-- load mouse buttons
require 'config.mouse'

-- set grobal keybinds
require 'config.keys.global'

-- add rules
require 'config.rules'

-- handle signals
require 'config.signal'

-- autostart apps 
require 'config.autostart'

-- widgets
require 'config.widgets.widgets_enabled'

-- worksoace
require 'workspace.enabled'
