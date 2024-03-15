return {
    {
        "ggandor/leap.nvim",
        lazy = false,
        init = function()
            local leap = require("leap")
            local user = require("leap.user")
            leap.create_default_mappings()
            leap.opts.special_keys.prev_target = "<backspace>"
            leap.opts.special_keys.prev_group = "<backspace>"
            user.set_repeat_keys("<enter>", "<backspace>")
        end,
    },
}
