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
    -- {
    --     "sayanarijit/xplr.vim",
    --     config = function()
    --         vim.cmd([[
    --             let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.9, 'highlight': 'Debug' } }
    --             let g:nnn#action = {
    --                   \ '<c-t>': 'tab split',
    --                   \ '<c-x>': 'split',
    --                   \ '<c-v>': 'vsplit' }
    --             let g:nnn#replace_netrw = 1
    --           ]])
    --     end,
    -- },
    {
        "Shatur/neovim-session-manager",
        lazy = false,
        opts = function()
            vim.isarray = function()
                return false
            end
            return {
                autoload_mode = require("session_manager.config").AutoloadMode.CurrentDir,
                autosave_only_in_session = true,
            }
        end,
        dependencies = { "nvim-lua/plenary.nvim" },
    },
}
