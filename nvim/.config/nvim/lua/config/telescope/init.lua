if not pcall(require, "telescope") then
    return
end

local actions = require("telescope.actions")
local sorters = require("telescope.sorters")
local themes = require("telescope.themes")

local builtin = require("telescope.builtin")

local dropdown = themes.get_dropdown({
    winblend = 10,
    border = true,
    previewer = false,
    shorten_path = false,
    layout_config = { width = 0.5 },
})

require("telescope").setup({
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
        file_sorter = sorters.get_fzy_sorter,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    },
})

require("telescope").load_extension("lazygit")
require("telescope").load_extension("harpoon")
