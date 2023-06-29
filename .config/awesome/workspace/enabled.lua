local enabled = {
  -- 'now_playing',
}

for i=1, #enabled do 
  require ('workspace.' .. enabled[i])
end
