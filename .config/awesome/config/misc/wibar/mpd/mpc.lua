local MPC = {
  now_playing = '',
  status = '',
  volume = '',
  progress_time = '',
  progress_percent = '',
  on_repeat = '',
  on_random = '',
  on_single = '',
}

local function split(data, delimiter)
  local match = {}
  local prev_match = 0
  for i = 1, #data do 
    if string.sub(data, i, i) == tostring(delimiter) then
      table.insert(match, string.sub(data, prev_match, i-1))
      prev_match = i+1
    end
    if i == #data then 
      table.insert(match, string.sub(data, prev_match, #data))
    end
  end
  return match 
end

function print_table(data)
  print '{ '
  for i = 1, #data do
    print(data[i] .. ' ')
  end
  print '}'
end


function MPC:refresh()
  local mpc = io.popen('mpc -f %title%', 'r')
  local out = {}
  for line in mpc:lines() do 
    table.insert(out, line)
  end
  mpc:close()
  self.now_playing = out[1]
  local status = split(string.gsub(out[2], '[ ]+', ' '), ' ')
  self.status = string.gsub(status[1], "[%[%]]", "")
  self.progress_time = status[3]
  self.progress_percent = string.gsub(status[4], "[()]", "")
  local _param = split(string.gsub(out[3], '[ ]+', ' '), ' ')
  self.volume = _param[2]
  self.on_repeat = _param[4]
  self.on_random = _param[6]
  self.on_single = _param[8]
end

return MPC
