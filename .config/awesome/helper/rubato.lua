local _M = {}

--[[
    paralelly manager multiple similar animations together without any coroutines 
    param structure 
    progress = directly from rubato 
    {
      value to alter,
      start,
      end,
    }
--]]

_M.parallel_exec = function(progress, ...)
  local param = table.pack(...)
  for i=1, #param do 
    local x0 = param[i][2]
    local x1 = param[i][3]
    local y = x0 + ((x1 - x0)*(progress/100))
    param[i][1](y)
  end
end

return _M
