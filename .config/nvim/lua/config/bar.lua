local colors = {
  blue   = '#80a0ff',
  green  = '#a6da96',
  black  = '#1e2031',
  white  = '#c6c6c6',
  red    = '#ed8797',
  violet = '#c6a0f7',
  grey   = '#363a50',
}

local catppuccin_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.violet, gui = 'bold' },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.white },

  },

  insert = { a = { fg = colors.black, bg = colors.green} },
  visual = { a = { fg = colors.black, bg = colors.violet}},
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.white },
  },
}

require("lualine").setup({
  options = {
    theme = catppuccin_theme,
    icons_enabled = true,
    section_separators = { left = '', right = '' },
    component_separators = { '' },
    sections = {
      lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
      lualine_b = { 'filename', 'branch' },
      lualine_c = {
        '%=', --[[ add your center compoentnts here in place of this comment ]]
      },
      lualine_x = {},
      lualine_y = { 'filetype', 'progress' },
      lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
      },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { 'location' },
    },
    tabline = {},
    extensions = {},
  }
})
