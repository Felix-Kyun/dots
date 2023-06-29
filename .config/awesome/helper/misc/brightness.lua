local _M = {
  current = 0.7
}

function _M:get_brightness()
  local cmd = "xrandr --prop --verbose | grep -A10 ' connected' | grep 'Brightness' | awk '{print $2}' "
  local out = io.popen(cmd)
  local value = out:read()
  out:close()
  return value
end

function _M:get_display()
   local cmd =  "xrandr | grep 'primary' | awk '{print $1}'"
   local out = io.popen(cmd)
   local value = out:read()
   out:close()
   return value
end

function _M:set_brightness(value)
  os.execute ('xrandr --output ' .. _M:get_display() .. ' --brightness ' .. tostring(value) )
end

function _M:inc(value)
  os.execute('xbacklight -inc ' .. tostring(value))
end

function _M:dec(value)
  os.execute('xbacklight -dec ' .. tostring(value))
end

return _M
