return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
    require("ibl").setup({
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
  end,
}
