local status_ok, color_scheme = pcall(require, 'catppuccin')
if not status_ok then
  return
end

require("catppuccin").setup({
  flavour = "auto", -- latte, frappe, macchiato, mocha
  background = { -- :h background
      light = "latte",
      dark = "mocha",
  },
  transparent_background = false, -- disables setting the background color.
  show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
  term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
  dim_inactive = {
      enabled = false, -- dims the background color of inactive window
      shade = "dark",
      percentage = 0.15, -- percentage of the shade to apply to the inactive window
  },
  no_italic = false, -- Force no italic
  no_bold = false, -- Force no bold
  no_underline = false, -- Force no underline
  styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
      comments = { "italic" }, -- Change the style of comments
      conditionals = { "italic" },
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
      -- miscs = {}, -- Uncomment to turn off hard-coded styles
  },
  color_overrides = {},
  custom_highlights = {},
  default_integrations = true,
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    treesitter = true,
    indent_blankline = {
      enabled = true,
      scope_color = "lavender", -- catppuccin color (eg. `lavender`) Default: text
      colored_indent_levels = false,
    },
    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  },
})


--[[
Load color scheme:
Note: The instruction to load the color scheme may vary depending on the
package.
See the README of the color scheme (i.e. git package) for information, for
example: require('color_scheme').setup{}, vim.cmd('color_scheme')
--]]
require('catppuccin').load()
--vim.cmd("colorscheme kanagawa")
--require('monokai').setup {}
--vim.cmd("colorscheme rose-pine")
