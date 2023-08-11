-- Lazy.vim (Package Manager) Setup

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

local lazy = require('lazy')

local plugins = {
  'lambdalisue/nerdfont.vim',
  'sharkdp/fd',
  'nixprime/cpsm',
  'romgrk/fzy-lua-native',
  'nvim-tree/nvim-web-devicons',
  'roxma/vim-hug-neovim-rpc',
  'roxma/nvim-yarp',
  'lewis6991/gitsigns.nvim',
  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',
  'Shatur/neovim-ayu',
  'tamton-aquib/staline.nvim',
}

lazy.setup(plugins, opts)

-- Environment Config

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.opt.laststatus=2
vim.opt.showtabline=2

-- Keybindings

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map('n', '<C-k>', '<Cmd>NvimTreeToggle<CR>', opts)

-- Staline (Status Line) Setup

require('staline').setup {
    defaults = {
        expand_null_ls = false,  -- This expands out all the null-ls sources to be shown
        left_separator  = "",
        right_separator = "",
        full_path       = false,
        line_column     = "[%l/%L] :%c 並%p%% ", -- `:h stl` to see all flags.

        fg              = "#000000",  -- Foreground text color.
        bg              = "none",     -- Default background is transparent.
        inactive_color  = "#303030",
        inactive_bgcolor = "none",
        true_colors     = false,      -- true lsp colors.
        font_active     = "none",     -- "bold", "italic", "bold,italic", etc

        mod_symbol      = "  ",
        lsp_client_symbol = " ",
        lsp_client_character_length = 12, -- Shorten LSP client names.
        branch_symbol   = " ",
        cool_symbol     = " ",       -- Change this to override default OS icon.
        null_ls_symbol = "",          -- A symbol to indicate that a source is coming from null-ls
    },
    mode_colors = {
        n = "#85fe62",
        i = "#c6abff",
        c = "#ffd966",
        v = "#62effe",   -- etc..
    },
    mode_icons = {
        n = " ",
        i = " ",
        c = " ",
        v = " ",   -- etc..
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
        packer = { 'Packer',' ' },        -- etc
    },
    lsp_symbols = {
        Error=" ",
        Info=" ",
        Warn=" ",
        Hint="",
    },
}

-- Stabline (Bufferlines) Setup

require('stabline').setup {
    style       = "bubble", -- others: arrow, slant, bubble
    font_active = "bold",
    fg          = "#ffffff",
    bg          = "#df8133",
    exclude_fts = { 'NvimTree', 'dashboard', 'lir' },
    stab_start  = "",   -- The starting of stabline
    stab_end    = "",
    numbers = function(bufn, n)
        return '*'..n..' '
    end
}

-- NvimTree (Directory Sidebar) Setup

local tree = require("nvim-tree")
local HEIGHT_RATIO = 0.8
local WIDTH_RATIO = 0.5

tree.setup({
  view = {
    float = {
      enable = true,
      open_win_config = function()
        local screen_w = vim.opt.columns:get()
        local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
        local window_w = screen_w * WIDTH_RATIO
        local window_h = screen_h * HEIGHT_RATIO
        local window_w_int = math.floor(window_w)
        local window_h_int = math.floor(window_h)
        local center_x = (screen_w - window_w) / 2
        local center_y = ((vim.opt.lines:get() - window_h) / 2)
                         - vim.opt.cmdheight:get()
        return {
          border = 'rounded',
          relative = 'editor',
          row = center_y,
          col = center_x,
          width = window_w_int,
          height = window_h_int,
        }
        end,
    },
    width = function()
      return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
    end,
  },
  filters = {
    dotfiles = true,
  },
  renderer = {
    indent_markers = { enable = true },
    icons = {
      show = {
        file = true,
	folder = true,
	folder_arrow = false,
	git = true,
      }
    }
  },
})

-- Colorscheme Setup
vim.cmd("colorscheme ayu-mirage")
