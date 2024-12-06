local status_ok, nvim_lualine = pcall(require, 'lualine')
if not status_ok then
  return
end

nvim_lualine.setup({
  options = {
    theme = 'catppuccin',
  }
})
