return {
    {
        "luukvbaal/nnn.nvim",
        opts = function()
            local builtin = require("nnn").builtin
            return {
                picker = {
                    cmd = "nnn -dH",
                    style = {
                        border = "rounded",
                    },
                },
                mappings = {
                    { "<C-t>", builtin.open_in_tab },
                    { "<C-s>", builtin.open_in_split },
                    { "<C-v>", builtin.open_in_vsplit },
                    { "<C-p>", builtin.open_in_preview },
                    { "<C-y>", builtin.copy_to_clipboard },
                    { "<C-w>", builtin.cd_to_path },
                    { "<C-e>", builtin.populate_cmdline },
                },
            }
        end,
        keys = {
            { "<leader>n", ":NnnPicker %<CR>", desc = "NNN" },
        },
    },
    {
        "Shatur/neovim-session-manager",
        lazy = false,
        opts = function()
            return {
                autoload_mode = require("session_manager.config").AutoloadMode.CurrentDir,
                autosave_only_in_session = true,
            }
        end,
        dependencies = { "nvim-lua/plenary.nvim" },
    },
}
