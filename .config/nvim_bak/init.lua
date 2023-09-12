-- environment

vim.g.loaded_netrw=1
vim.g.loaded_netrwPlugin=1
vim.opt.laststatus=2
vim.opt.showtabline=2
vim.opt.termguicolors = true
vim.cmd("set background=dark noshowmode cursorline")

-- lazy.vim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {

  -- staline
  {
      "tamton-aquib/staline.nvim",
  },

  -- nvimtree
  {
      "nvim-tree/nvim-tree.lua",
      depenencies = {
          'nvim-tree/nvim-web-devicons',
      },
  },

  -- colorscheme
  {
      "Shatur/neovim-ayu",
  },

  -- dashboard
  {
      "willothy/veil.nvim",
      lazy = true,
      dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
      },
  config = true,
  },

  -- cursorline 
  {
      "yamatsum/nvim-cursorline",
  },

}
local lazy = require("lazy")

lazy.setup(plugins, opts)

-- staline

local staline = require('staline')

staline.setup{
    defaults = {
        expand_null_ls = false,  -- This expands out all the null-ls sources to be shown
        left_separator  = "",
        right_separator = "",
        full_path       = false,
        line_column     = "%l/%L :%c  󰈙 %p%% ", -- `:h stl` to see all flags.

        fg              = "#000000",  -- Foreground text color.
        bg              = "none",     -- Default background is transparent.
        inactive_color  = "#303030",
        inactive_bgcolor = "none",
        true_colors     = false,      -- true lsp colors.
        font_active     = "none",     -- "bold", "italic", "bold,italic", etc

        mod_symbol      = "  ",
        lsp_client_symbol = " ",
        lsp_client_character_length = 12, -- Shorten LSP client names.
        branch_symbol   = " ",
        cool_symbol     = " ",       -- Change this to override default OS icon.
        null_ls_symbol = "",          -- A symbol to indicate that a source is coming from null-ls
    },
    mode_colors = {
        n = "#d2a6ff",
        i = "#ffad66",
        c = "#aad94c",
        v = "#73d0ff",   -- etc..
    },
    mode_icons = {
        n = "󰈈 ",
        i = "󰏫 ",
        c = " ",
        v = "󰒆 ",   -- etc..
    },
    sections = {
        left = { '- ', '-mode', 'left_sep_double', ' ', 'branch' },
        mid  = { 'file_name' },
        right = { 'cool_symbol','right_sep_double', '-line_column' },
    },
    inactive_sections = {
        left = { 'branch' },
        mid  = { 'file_name' },
        right = { 'line_column' }
    },
    special_table = {
        NvimTree = { 'NvimTree', ' ' },
        lazy = { 'Lazy',' ' },        -- etc
    },
    lsp_symbols = {
        Error=" ",
        Info=" ",
        Warn=" ",
        Hint="",
    },
}


-- nvimtree

local nvimtree = require("nvim-tree")
local gheight = vim.api.nvim_list_uis()[1].height
local gwidth = vim.api.nvim_list_uis()[1].width
local width = 50
local height = 30

nvimtree.setup({
  view = {
    float = {
      enable = true,
      quit_on_focus_loss = true,
      open_win_config = {
        relative = "editor",
	border = "rounded",
        relative = "editor",
        width = width,
        height = height,
        row = (gheight - height) * 0.5,
        col = (gwidth - width) * 0.5,
      }
    }
  }
})

-- colorscheme

require('ayu').setup({
    mirage = true
})

vim.cmd("colorscheme ayu")

-- dashboard

local builtin = require("veil.builtin")

local default = {
  sections = {
    builtin.sections.animated(builtin.headers.frames_nvim, {
      hl = { fg = "#5de4c7" },
    }),
    builtin.sections.buttons({
      {
        icon = "",
        text = "Find Files",
        shortcut = "f",
        callback = function()
            require("telescope.builtin").find_files()
        end,
      },
      {
        icon = "",
        text = "Find Word",
        shortcut = "w",
        callback = function()
            require("telescope.builtin").live_grep()
        end,
      },
      {
        icon = "",
        text = "Buffers",
        shortcut = "b",
        callback = function()
            require("telescope.builtin").buffers()
        end,
      },
      {
        icon = "",
        text = "Config",
        shortcut = "c",
        callback = function()
          require("telescope").extensions.file_browser.file_browser({
            path = vim.fn.stdpath("config"),
          })
        end,
      },
    }),
    builtin.sections.oldfiles(),
  },
  mappings = {},
  startup = true,
  listed = false
}

-- cursorline

require('nvim-cursorline').setup {
  cursorline = {
    enable = true,
    timeout = 0,
    number = true,
  },
  cursorword = {
    enable = true,
    min_length = 3,
    hl = { underline = true },
  }
}

