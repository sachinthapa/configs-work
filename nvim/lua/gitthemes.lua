local Color = require('github-theme.lib.color')
local primitives = require('github-theme.palette.primitives.dark')
local scale = primitives.scale

local palettes = {
  github_dark_default = {
      black = '#111210',
      bg1 = '#2f312c',
      bg2 = '#383b35',
      bg3 = '#3a3d37',
      bg_d = '#1c1e1b',
      bg_blue = '#68aee8',
      bg_yellow = '#e2c792',
      purple = '#aaaaff',
      o_green = '#8fb573',
      o_orange = '#ff9966',
      o_blue = '#57a5e5',
      o_yellow = '#dbb671',
      o_cyan = '#70c2be',
      o_red = '#e75a7c',
      o_coral = '#f08080',
      o_grey = '#5b5e5a',
      o_light_grey = '#838781',
      o_dark_cyan = '#2b5d63',
      o_dark_red = '#833b3b',
      o_dark_yellow = '#7c5c20',
      o_dark_purple = '#79428a',
      o_diff_add = '#40531b',
      o_diff_delete = '#893f45',
      o_diff_change = '#2a3a57',
      o_diff_text = '#3a4a67',
  }
}

local specs = {
 github_dark_default = {
   syntax = {
     bracket = scale.gray[3],
     -- builtin0= scale.green[5],
     builtin1 = scale.orange[6],  -- var, int .....,
     -- builtin2= scale.green[5],
     const = scale.green[5],
     func = scale.orange[6],
     -- ident = scale.gray[9],
     -- field = scale.gray[9],
     -- variables = scale.gray[2],
     keyword = scale.orange[6],
     string = scale.green[5],
     -- conditional = 'o_blue',
     -- operator = 'o_blue',
     -- type = 'o_yellow',
     comment = scale.gray[6],
  }
 }
}

-- setup must be called before loading
require('github-theme').setup({
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath('cache') .. '/github-theme',
    compile_file_suffix = '_compiled', -- Compiled file suffix
    hide_end_of_buffer = true, -- Hide the '~' character at the end of the buffer for a cleaner look
    hide_nc_statusline = true, -- Override the underline style for non-active statuslines
    transparent = true,       -- Disable setting background
    terminal_colors = true,    -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = false,      -- Non focused panes set to alternative background
    module_default = true,     -- Default enable value for modules
    styles = {                 -- Style to be applied to different syntax groups
      comments = 'NONE',       -- Value is any valid attr-list value `:help attr-list`
      functions = 'NONE',
      keywords = 'bold',
      variables = 'NONE',
      conditionals = 'NONE',
      constants = 'italic',
      numbers = 'NONE',
      operators = 'NONE',
      strings = 'NONE',
      types = 'NONE',
    },
    inverse = {                -- Inverse highlight for different types
      match_paren = false,
      visual = false,
      search = false,
    },
    darken = {                 -- Darken floating windows and sidebar-like windows
      floats = false,
      sidebars = {
        enable = true,
        list = {},             -- Apply dark background to specific windows
      },
    },
    modules = {                -- List of various plugins and additional options
      -- ...
    },
  },
  palettes = palettes,
  specs = specs,
  groups = {},
})

