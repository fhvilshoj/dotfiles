--[[ vars.lua ]]
local g = vim.g
g.t_co = 256 -- Term colors
g.background = "dark"
g.colorscheme = "gruvbox"

-- Update the packpath
local packer_path = vim.fn.stdpath("config") .. "/site"
vim.o.packpath = vim.o.packpath .. "," .. packer_path
