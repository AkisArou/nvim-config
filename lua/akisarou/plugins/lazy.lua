-- lazy.nvim
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

require("lazy").setup({
  {
    'neoclide/coc.nvim',
    branch = "release",
    lazy = false
  },
  {
    'folke/which-key.nvim',
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  'nvim-treesitter/nvim-treesitter',
  {
  'nvim-telescope/telescope.nvim', tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
  'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make'
  },
  {'akinsho/toggleterm.nvim', version = "*", config = true},
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
     vim.cmd[[colorscheme tokyonight]]
    end
  },
  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        -- config
      }
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },
  {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
 {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  'nvim-tree/nvim-tree.lua',
  'gelguy/wilder.nvim',
  'lewis6991/gitsigns.nvim',
  'tpope/vim-surround',
  'windwp/nvim-autopairs',
  'windwp/nvim-ts-autotag',
  'numToStr/Comment.nvim',
  'NvChad/nvim-colorizer.lua',
  'lukas-reineke/indent-blankline.nvim'
})

