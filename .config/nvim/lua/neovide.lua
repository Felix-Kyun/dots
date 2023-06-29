local v = vim.g
if v.neovide then 
  print "opened in neovide"
  vim.opt.guifont = {"FiraCode Nerd Font", "h14"}
  v.neovide_scale_factor = 0.8
  v.neovide_scroll_animation_length = 0.3
  v.neovide_hide_mouse_when_typing = true
  v.neovide_refresh_rate = 60
  v.neovide_refresh_rate_idle = 5
  v.neovide_cursor_animation_length = 0.10
  v.neovide_cursor_trail_size = 0.75
  v.neovide_cursor_antialiasing = true
  v.neovide_cursor_vfx_mode = "pixiedust"
  v.neovide_transparency = 0.3
end
