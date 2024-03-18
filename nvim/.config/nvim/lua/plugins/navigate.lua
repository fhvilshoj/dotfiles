return {
    {
        "ggandor/leap.nvim",
        lazy = false,
        init = function()
            local leap = require("leap")
            local user = require("leap.user")
            leap.opts.special_keys.prev_target = "<backspace>"
            leap.opts.special_keys.prev_group = "<backspace>"
            user.set_repeat_keys("<enter>", "<backspace>")
        end,
        keys = {
            { "<leader>sf", "<Plug>(leap-forward)",     mode = { "n", "o", "x" }, desc = "Leap forward" },
            { "<leader>sb", "<Plug>(leap-backward)",    mode = { "n", "o", "x" }, desc = "Leap backward" },
            { "<leader>sp", "<Plug>(leap-from-window)", mode = { "n", "o", "x" }, desc = "Leap other panes" },
        },
    },
}
