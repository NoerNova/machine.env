-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

vim.opt.relativenumber = true
-- vim.opt.guifont = "MesloLGM Nerd Font Mono:h17"
vim.opt.termguicolors = true
lvim.transparent_window = true
lvim.builtin.lualine.style = "lvim"
lvim.builtin.nvimtree.setup.filters = {
  dotfiles = false,
  custom = { '.git', '.cache', '.DS_Store' },
}

-- Plugins
lvim.plugins = {
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  { "hiphish/rainbow-delimiters.nvim" },
  {
    "folke/lsp-colors.nvim",
    event = "BufRead",
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  { "tiagovla/tokyodark.nvim" },
  { "Luxed/ayu-vim" },
  { "chrisbra/colorizer" },
  { "Exafunction/codeium.vim" },
  { "catppuccin/nvim",                name = "catppuccin", priority = 1000 },
  { "whatyouhide/vim-gotham" },
}

require("lvim.lsp.manager").setup("cssls", {
  settings = {
    css = {
      validate = true,
      lint = {
        unknownAtRules = "ignore"
      }
    },
    scss = {
      validate = true,
      lint = {
        unknownAtRules = "ignore"
      }
    },
    less = {
      validate = true,
      lint = {
        unknownAtRules = "ignore"
      }
    },
  },
})

require("lvim.lsp.null-ls.formatters").setup(
  {
    {
      command = "prettierd",
      filetypes = { "typescript", "typescriptreact" },
    },
  }
)

-- Post plugins
lvim.builtin.treesitter.rainbow.enable = true

-- tokyodark
-- vim.g.tokyodark_transparent_background = true
-- vim.g.tokyodark_enable_italic_comment = true
-- vim.g.tokyodark_enable_italic = false
-- vim.g.tokyodark_color_gamma = "1.0"
-- lvim.colorscheme = "tokyodark"

-- ayu-vim
-- vim.g.ayucolor = "mirage"
-- lvim.colorscheme = "ayu"

-- catppuccin
require("catppuccin").setup({
  flavour = "mocha",
  transparent_background = true
})
lvim.colorscheme = "catppuccin"

-- gotham

-- lvim.colorscheme = "gotham256"
