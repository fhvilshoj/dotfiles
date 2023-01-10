-- LEADER
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- IMPORTS
require("vars")
require("opts")
require("keys")
require("plugins")
