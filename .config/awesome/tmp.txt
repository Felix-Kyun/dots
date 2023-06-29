local MPC = {
  status = '',
  now_playing = '',
  volume = '',
  progress_time = '',
  progress_percent = '',
  on_repeat = '',
  on_shuffle = '',
  on_single = '',
}

function MPC:refresh_data()
  local cmd = io.popen('mpc', 'r')
  local out = {}
  for lines in cmd:lines() do 
    out[#out + 1] = lines
  end
  cmd:close()
  print (#out)
  self.now_playing = out[1]
  self.status = string.gsub(string.match(out[2], "%[%l+%]"), "[%[%]]", "")
end
  
function MPC :get_callback(cmd) return function() os.execute('mpc ' .. cmd) end end

return MPC
