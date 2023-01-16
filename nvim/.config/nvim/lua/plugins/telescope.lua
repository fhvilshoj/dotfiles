return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "kdheepak/lazygit.nvim" },
        { "ThePrimeagen/harpoon" },
        { "nvim-lua/popup.nvim" },
        { "nvim-telescope/telescope-symbols.nvim" },
    },
    opts = function()
        if not pcall(require, "telescope") then
            return {}
        end

        local actions = require("telescope.actions")
        return {
            defaults = {
                prompt_prefix = "   ",
                selection_caret = "❯ ",
                winblend = 10,
                layout_strategy = "horizontal",
                layout_config = {
                    prompt_position = "top",
                    -- preview_cutoff = 120,
                    horizontal = {
                        width_padding = 0.1,
                        height_padding = 0.1,
                        preview_width = 0.6,
                    },
                    vertical = {
                        width_padding = 0.05,
                        height_padding = 1,
                        preview_height = 0.5,
                    },
                },
                selection_strategy = "reset",
                sorting_strategy = "ascending",
                scroll_strategy = "cycle",
                color_devicons = true,
                dynamic_preview_title = true,
                mappings = {
                    i = {
                        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                    },
                    n = {
                        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                        ["<Space>q"] = actions.close,
                    },
                },
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "--hidden",
                    -- "--glob='!.git/*'"
                },
                borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                file_sorter = require("telescope.sorters").get_fzy_sorter,
                file_previewer = require("telescope.previewers").vim_buffer_cat.new,
                grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
                qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
            },
        }
    end,
    config = function()
        require("telescope").load_extension("lazygit")
        require("telescope").load_extension("harpoon")
    end,
    keys = function()
        if not pcall(require, "telescope") then
            return {}
        end

        local pickers = require("config.telescope.pickers")
        return {
            { "<c-r><c-r>", "<Plug>(TelescopeFuzzyCommandSearch)", mode = "c", nowait = true, desc = "Search history" },

            { "<leader>/", pickers.grep_last_search, desc = "Find last search" },
            { "<leader>,", pickers.edit_directory("Neovim", "~/dotfiles"), desc = "Find config files" },
            { "<leader><space>", pickers.commands, desc = "Find command" },

            { "<leader>fw", pickers.grep_curr_string, mode = { "v", "n" }, desc = "Find word" },
            { "<leader>ff", pickers.find_files, desc = "Find files" },
            { "<leader>fa", pickers.find_all_files, desc = "Find all files" },
            { "<leader>fb", pickers.current_buffer_fuzzy_find, desc = "Find in buffer" },
            { "<leader>fB", pickers.buffers, desc = "Find buffer" },
            { "<leader>fc", pickers.command_history, desc = "Find command history" },

            { "<leader>fp", pickers.grep_promp, desc = "Grep prompt" },
            { "<leader>fg", pickers.git_files, desc = "Find git files" },
            { "<leader>fh", ":Telescope harpoon  marks<CR>", desc = "Find Harpoon" },
            { "<leader>fe", pickers.live_grep, desc = "Live grep" },

            { "<leader>fr", pickers.lsp_references, desc = "Find LSP refs." },
            { "<leader>fD", pickers.diagnostics, desc = "Find diabnostics" },
            { "<leader>fs", pickers.lsp_document_symbols, desc = "Find doc symbols" },
            { "<leader>fS", pickers.lsp_dynamic_workspace_symbols, desc = " find workspace symbols" },
            { "<leader>fo", pickers.vim_options, desc = "Find vim option" },
            { "<leader>fl", pickers.builtin, desc = "Find picker" },
            { "<leader>fR", pickers.resume, desc = "Resume find" },

            { "[q", ":cprev<CR>zz", desc = "Next quick fix" },
            { "]q", ":cnext<CR>zz", desc = "Prev. quick fix" },
        }
    end,
}
