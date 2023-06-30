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

-- https://github.com/gbprod/nord.nvim

--[[ require("nord").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  transparent = false, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  diff = { mode = "fg" }, -- enables/disables colorful backgrounds when used in diff mode. values : [bg|fg]
  borders = true, -- Enable the border between verticaly split windows visible
  errors = { mode = "fg" }, -- Display mode for errors and diagnostics
                            -- values : [bg|fg|none]
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = {},
    functions = {},
    variables = {},

    -- To customize lualine/bufferline
    bufferline = {
      current = {},
      modified = { italic = true },
    },
  },

  -- colorblind mode
  -- see https://github.com/EdenEast/nightfox.nvim#colorblind
  -- simulation mode has not been implemented yet.
  colorblind = {
    enable = false,
    preserve_background = false,
    severity = {
      protan = 0.0,
      deutan = 0.0,
      tritan = 0.0,
    },
  },

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with all highlights and the colorScheme table
  on_highlights = function(highlights, colors) end,
})
]]


