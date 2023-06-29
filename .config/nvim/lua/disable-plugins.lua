--                    ______     ___           __ __
--                   / ____/__  / (_)  __     / //_/_  ____  ______
--                  / /_  / _ \/ / / |/_/    / ,< / / / / / / / __ \
--                 / __/ /  __/ / />  <     / /| / /_/ / /_/ / / / /
--                /_/    \___/_/_/_/|_|____/_/ |_\__, /\__,_/_/ /_/
--                                   /_____/    /____/
-- 				                nvim config [disable useless plugins]

local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end