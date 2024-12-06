local status_ok, ibl = pcall(require, 'ibl')
if not status_ok then
  return
end

ibl.setup({
  indent = {
    char = "▏",
  },
  scope = {
    enabled = true,
    show_start = true,
  },
  exclude = {
    buftypes = {
      'terminal',
      'nofile',
      'quickfix',
      'prompt',
    },
    filetypes = {
      'lspinfo',
      'checkhealth',
      'help',
      'man',
      'dashboard',
      'git',
      'markdown',
      'text',
      'terminal',
      'NvimTree',
    }
  }
})
