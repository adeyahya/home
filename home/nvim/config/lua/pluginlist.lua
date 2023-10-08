return {
  {
    "akinsho/toggleterm.nvim",
    config = true
  },
  --comment
  {
    "tpope/vim-commentary"
  },
  -- breadcrumb
  {
    "SmiteshP/nvim-navic",
    dependencies = {
      "neovim/nvim-lspconfig"
    }
  },
  {
    "nvim-tree/nvim-tree.lua",
  },
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 1000
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.3",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "catppuccin-mocha"
    end
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp"
    }
  },
  {
    "xiyaowong/transparent.nvim",
    config = function()
      -- require("transparent").clear_prefix("lualine")
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require("lualine").setup({
        icons_enabled = true,
        theme = "catppuccin"
      })
    end
  },
  "neovim/nvim-lspconfig",
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp"
    }
  },
  -- fix lua vim lsp
  "folke/neodev.nvim"
}
