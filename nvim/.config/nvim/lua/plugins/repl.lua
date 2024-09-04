return {
    {
        "Vigemus/iron.nvim",
        config = function()
            local iron = require("iron.core")
            iron.setup({
                config = {
                    scratch_repl = true,
                    repl_definition = {
                        python = {
                            command = { "ipython", "--no-autoindent" },
                            format = require("iron.fts.common").bracketed_paste_python,
                        },
                    },
                    repl_open_cmd = require("iron.view").right(80),
                },
                keymaps = {
                    send_line = "<leader>il",
                    send_paragraph = "<leader>ip",
                    visual_send = "<leader>iv",
                },
            })
        end,
        keys = {
            { "<leader>ii", ":IronRepl<CR>",  desc = "Iron REPL" },
            { "<leader>if", ":IronFocus<CR>", desc = "Focus REPL" },
        },
    },
}
