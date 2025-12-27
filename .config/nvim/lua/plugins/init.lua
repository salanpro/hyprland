return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

{
  'mrcjkb/rustaceanvim',
  version = '^6',
  lazy = false,
  ft = "rust",
},

  {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
  },
},

{
  "phaazon/hop.nvim",
  branch = "v2",
  event = "BufRead",
  config = function()
    require("hop").setup({
      keys = 'etovxqpdygfblzhckisuran'
    })
  end,
  keys = {
    { "qw", "<cmd>HopWord<cr>", desc = "Hop Word" },
    { "qq", "<cmd>HopLine<cr>", desc = "Hop Line" },
    { "<leader>hc", "<cmd>HopChar1<cr>", desc = "Hop Char" },
    { "<leader>h/", "<cmd>HopPattern<cr>", desc = "Hop Pattern" },
    { "<leader>ha", "<cmd>HopAnywhere<cr>", desc = "Hop Anywhere" },
  },
},

   {
    "armannikoyan/rusty",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = false, -- cambia a true si quieres transparencia
      italic_comments = true,
      underline_current_line = true,
      colors = {
        foreground = "#c5c8c6",
        background = "#1d1f21",
        selection = "#373b41",
        line = "#282a2e",
        comment = "#969896",
        red = "#cc6666",
        orange = "#de935f",
        yellow = "#f0c674",
        green = "#b5bd68",
        aqua = "#8abeb7",
        blue = "#81a2be",
        purple = "#b294bb",
        window = "#4d5057",
      },
    },
    config = function(_, opts)
      require("rusty").setup(opts)
    end,
  },

  {
  "nasccped/rustheme.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("rustheme").setup()
    vim.cmd("colorscheme rustheme")
  end,
},



  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
