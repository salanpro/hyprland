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
  version = '^9',
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
    'smoka7/hop.nvim',
    version = "*",
    opts = {
        keys = 'etovxqpdygfblzhckisuran'
    },
    keys = {
        { "qw", "<cmd>HopWord<cr>", desc = "Hop Word" },
        { "qq", "<cmd>HopLine<cr>", desc = "Hop Line" },
        { "<leader>hc", "<cmd>HopChar1<cr>", desc = "Hop Char" },
        { "<leader>h/", "<cmd>HopPattern<cr>", desc = "Hop Pattern" },
        { "<leader>ha", "<cmd>HopAnywhere<cr>", desc = "Hop Anywhere" },
    },
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
