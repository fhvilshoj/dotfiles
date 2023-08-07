return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufRead",
    config = function()
      require("config.treesitter")
    end,
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/nvim-treesitter-context",
    },
  },
  {
    "windwp/nvim-spectre",
    dependencies = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>R", ":lua require('spectre').open()<CR>", desc = "Rename" },
    },
    opts = {
      mapping = {
        ["send_to_qf"] = {
          map = "<C-q>",
          cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
        },
      },
    },
  },
  {
    "numToStr/Comment.nvim",
    event = "BufRead",
    config = true,
  },
  {
    "danymat/neogen",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      { "<leader>cs", ":lua require('neogen').generate()<CR>", desc = "Generate Stub" },
    },
    config = true,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = "BufRead",
    opts = { automatic_installation = true },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    lazy = false,
    config = function()
      -- [[ Auto Completion ]]
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lsp_conf = require("lspconfig")
      local settings = { capabilities = capabilities }
      lsp_conf.pyright.setup(settings)
      lsp_conf.lua_ls.setup(settings)
      lsp_conf.tsserver.setup(settings)
      lsp_conf.tailwindcss.setup(settings)
      lsp_conf.prismals.setup(settings)
    end,
  },
  {
    "glepnir/lspsaga.nvim", -- a maintained fork of glepnir/lspsaga.nvim
    event = "BufRead",
    config = function()
      require("lspsaga").setup({})
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      -- Code
      {
        "<leader>cu",
        "<cmd>Lspsaga lsp_finder<CR>",
        silent = true,
        desc = "Find usage",
      },
      {
        "<leader>ca",
        "<cmd>Lspsaga code_action<CR>",
        mode = { "n", "v" },
        silent = true,
        desc = "Code actions",
      },
      {
        "<leader>cr",
        "<cmd>Lspsaga rename<CR>",
        silent = true,
        desc = "Rename",
      },
      {
        "<leader>cp",
        "<cmd>Lspsaga peek_definition<CR>",
        silent = true,
        desc = "Peak definition",
      },
      {
        "<leader>cl",
        "<cmd>Lspsaga show_line_diagnostics<CR>",
        silent = true,
        desc = "Line diagnostics",
      },
      {
        "<leader>cc",
        "<cmd>Lspsaga show_cursor_diagnostics<CR>",
        silent = true,
        desc = "Cursor diagnostics",
      },
      {
        "<leader>ch",
        "<cmd>Lspsaga hover_doc<CR>",
        silent = true,
        desc = "Hover docs",
      },
      -- Go to
      { "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>",               desc = "Go to definition" },
      { "<leader>gv", ":vsp<cr> <cmd>lua vim.lsp.buf.definition()<CR>",      desc = "(v) Go to definition" },
      { "<leader>gx", ":sp<cr> <cmd>lua vim.lsp.buf.definition()<CR>",       desc = "(h) Go to definition" },
      { "<leader>gt", ":tab split<cr><cmd>lua vim.lsp.buf.definition()<CR>", desc = "(t) Go to definition" },
      -- Next/prev.
      {
        "[e",
        "<cmd>Lspsaga diagnostic_jump_prev<CR>",
        silent = true,
        desc = "Next diagnostic",
      },
      {
        "]e",
        "<cmd>Lspsaga diagnostic_jump_next<CR>",
        silent = true,
        desc = "Pref. diagnostic",
      },
      {
        "[E",
        function()
          require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
        end,
        silent = true,
        desc = "Next error",
      },
      {
        "]E",
        function()
          require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
        end,
        silent = true,
        desc = "Prev. error",
      },
    },
  },
  { "pantharshit00/vim-prisma" },
}
