--                    ______     ___           __ __
--                   / ____/__  / (_)  __     / //_/_  ____  ______
--                  / /_  / _ \/ / / |/_/    / ,< / / / / / / / __ \
--                 / __/ /  __/ / />  <     / /| / /_/ / /_/ / / / /
--                /_/    \___/_/_/_/|_|____/_/ |_\__, /\__,_/_/ /_/
--                                   /_____/    /____/
-- 				                nvim config [theme.lua]

-- github.com/shaunsingh/nord.nvim

local theme_opt = {
  nord_contrast                 = false,
  nord_borders                  = true,
  nord_disable_background       = true,
  nord_italic                   = true,
  nord_uniform_diff_background  = true,
  nord_enable_sidebar_background= true,
  nord_cursorline_transparent   = false,
}

for k, v in pairs(theme_opt) do vim.g[k] = v end
require('nord').set()
