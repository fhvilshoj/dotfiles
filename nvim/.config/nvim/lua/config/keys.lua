local M = {}

function M.register()
    local nnoremap = function(t)
        vim.keymap.set("n", t[1], t[2], t[3])
    end

    -- Scrolling
    nnoremap({ "<C-d>", "<C-d>zz", {} })
    nnoremap({ "<C-u>", "<C-u>zz", {} })

    local wk = require("which-key")
    wk.register({
        b = { name = "buffer" },
        c = { name = "code" },
        f = { name = "find" },
        g = { name = "go-to" },
        h = { name = "harpoon" },
        m = { name = "markdown" },
        w = {
            name = "window", -- optional group name
            j = { ":resize -2<CR>", "Resize (h-)" },
            k = { ":resize +2<CR>", "Resize (h+)" },
            h = { ":vertical resize -10<CR>", "Resize (v-)" },
            l = { ":vertical resize +10<CR>", "Resize (v+)" },
            ["_"] = { "<C-w>_", "Full height" },
            ["|"] = { "<C-w>|", "Full width" },
            ["="] = { "<C-w>=", "Distr. equally" },
            f = { "<C-w>|<C-w>_", "Full. screen" },
        },
        y = {
            name = "yank",
            y = { '"*y', "Yank to clipboard" },
        },
        z = { name = "zettelkasten" },
    }, { prefix = "<leader>" })
    wk.register({
        ["["] = {
            name = "Prev",
            q = { ":cprev<CR>zz", "Previous quickfix" },
        },
        ["]"] = {
            name = "Next",
            q = { ":cprev<CR>zz", "Next quickfix" },
        },
    })
end

return M
