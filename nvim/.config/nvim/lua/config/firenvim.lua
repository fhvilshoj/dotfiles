local g = vim.g

g.firenvim_config = {
  globalSettings = {
    alt = "all",
  },
  localSettings = {
    [".*"] = {
      cmdline = "neovim",
      priority = 0,
      selector = "textarea",
      takeover = "never",
    },
  },
}

