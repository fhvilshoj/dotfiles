local languages = {
  "bash",
  "c",
  "cmake",
  "cpp",
  "css",
  "go",
  "graphql",
  "html",
  "http",
  "javascript",
  "jsdoc",
  "json",
  "lua",
  "python",
  "regex",
  "rust",
  "scss",
  "toml",
  "tsx",
  "typescript",
  "vim",
  "yaml",
}

require("nvim-treesitter.configs").setup({
  ensure_installed = languages,
  highlight = {
    enable = true,
  },
  rainbow = {
    enable = false,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
  },
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
  },
  keymaps = {
    -- You can use the capture groups defined in textobjects.scm
    ["af"] = "@function.outer",
    ["if"] = "@function.inner",
    ["ac"] = "@class.outer",
    ["ic"] = "@class.inner",
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
})

require("treesitter-context").setup({})
