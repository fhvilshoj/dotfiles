if not pcall(require, "telescope") then
    return
end

local cnoremap = require("utils.mappers").cnoremap
local vnoremap = require("utils.mappers").vnoremap
local nnoremap = require("utils.mappers").nnoremap
local pickers = require("config.telescope.pickers")

cnoremap({ "<c-r><c-r>", "<Plug>(TelescopeFuzzyCommandSearch)", { nowait = true } })

nnoremap({ "<leader>fa", pickers.find_all_files })
nnoremap({ "<leader>fb", pickers.current_buffer_fuzzy_find })
nnoremap({ "<leader>fc", pickers.command_history })
nnoremap({ "<leader>fe", pickers.live_grep })
nnoremap({ "<leader>ff", pickers.find_files })
nnoremap({ "<leader>fg", pickers.git_files })
nnoremap({ "<leader>fh", ":Telescope harpoon  marks<CR>" })
nnoremap({ "<leader>fp", pickers.grep_prompt })
vnoremap({ "<leader>fw", pickers.grep_curr_string })

nnoremap({ "<leader>/", pickers.grep_last_search })
nnoremap({ "<leader>,", pickers.edit_directory("Neovim", "~/.config/nvim") })
nnoremap({ "<leader>fn", pickers.edit_directory("Notes", "~/Documents/Notes") })
nnoremap({ "<leader>go", pickers.git_branches })
nnoremap({ "<leader><space>", pickers.commands })
nnoremap({ "<leader>gr", pickers.lsp_references })
nnoremap({ "<leader>D", pickers.diagnostics })
nnoremap({ "<leader>s", pickers.lsp_document_symbols })
nnoremap({ "<leader>S", pickers.lsp_dynamic_workspace_symbols })
nnoremap({ "<leader>ht", pickers.help_tags })
nnoremap({ "<leader>ho", pickers.vim_options })
nnoremap({ "<leader>tl", pickers.builtin })
nnoremap({ "<leader>tr", pickers.resume })
nnoremap({ "<leader>ft", pickers.filetypes })
