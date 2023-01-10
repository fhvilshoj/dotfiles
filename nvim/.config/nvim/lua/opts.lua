--[[ opts.lua ]]
local opt = vim.opt
local cmd = vim.api.nvim_command
local auto_cmd = vim.api.nvim_create_autocmd

--[[ Context ]]
opt.colorcolumn = "81"
opt.number = true
opt.relativenumber = true
opt.scrolloff = 4
opt.signcolumn = "yes"

--[[ Filetypes ]]
opt.encoding = "utf8"
opt.fileencoding = "utf8"

-- [[ Theme ]]
opt.syntax = "ON"
opt.termguicolors = true
cmd("colorscheme dracula") -- cmd:  Set the colorscheme

-- [[ Search ]]
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- [[ Whitespace ]]
opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4

-- [[ Indent ]]
opt.copyindent = true
opt.preserveindent = true
opt.autoindent = true
opt.smartindent = true

-- [[ Splits ]]
opt.splitright = true
opt.splitbelow = true

-- [[ Backup ]]
opt.backupdir = "./.backup,.,/tmp"
opt.directory = ".,./.backup,/tmp"

-- [[ Spell ]]
opt.spell = true
opt.spelllang = { "en" }

auto_cmd({ "BufRead", "BufNewFile" }, { pattern = "*.mdx", command = "setlocal syntax=markdown" })
