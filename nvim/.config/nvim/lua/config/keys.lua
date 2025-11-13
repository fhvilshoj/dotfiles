local M = {}

function M.register()
    local nnoremap = function(t)
        vim.keymap.set("n", t[1], t[2], t[3])
    end

    -- Scrolling
    nnoremap({ "<C-d>", "<C-d>zz", {} })
    nnoremap({ "<C-u>", "<C-u>zz", {} })

    -- Window resizing
    nnoremap({ "<M-j>", ":resize -2<CR>" })
    nnoremap({ "<M-k>", ":resize +2<CR>" })
    nnoremap({ "<M-h>", ":vertical resize -10<CR>" })
    nnoremap({ "<M-l>", ":vertical resize +10<CR>" })

    local wk = require("which-key")
    wk.add({
        { "<leader>D",  group = "DB" },
        { "<leader>S",  group = "Jump Treesitter" },
        { "<leader>a",  group = "formatter" },
        { "<leader>b",  group = "buffer" },
        { "<leader>c",  group = "code" },
        { "<leader>f",  group = "find" },
        { "<leader>g",  group = "go-to" },
        { "<leader>h",  group = "harpoon" },
        { "<leader>i",  group = "iron" },
        { "<leader>m",  group = "markdown" },
        { "<leader>s",  group = "jump" },
        { "<leader>w",  group = "window" },
        { "<leader>w=", "<C-w>=",                   desc = "Distr. equally" },
        { "<leader>w_", "<C-w>_",                   desc = "Full height" },
        { "<leader>wf", "<C-w>|<C-w>_",             desc = "Full. screen" },
        { "<leader>wh", ":vertical resize -10<CR>", desc = "Resize (v-)" },
        { "<leader>wj", ":resize -2<CR>",           desc = "Resize (h-)" },
        { "<leader>wk", ":resize +2<CR>",           desc = "Resize (h+)" },
        { "<leader>wl", ":vertical resize +10<CR>", desc = "Resize (v+)" },
        { "<leader>w|", "<C-w>|",                   desc = "Full width" },
        { "<leader>y",  group = "yank" },
        {
            "<leader>yy",
            '"*y',
            desc = "Yank to clipboard",
            mode = { "n", "v" },
        },
        { "<leader>z",  group = "zettelkasten" },
        { "<leader>ab", desc = "<cmd>'<,'>.!genericformat --format black<CR>", mode = { "n", "v" } },
    })
    wk.add({
      { "<leader>u", group = "Utils" },
      { "<leader>ud", function() -- Insert current date at cursor
          local date = os.date('%A, %Y-%b-%d')
          local row, col = unpack(vim.api.nvim_win_get_cursor(0))
          vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, {date})
          vim.api.nvim_win_set_cursor(0, {row, col + #date})
        end,
        desc = "Date"
      }
    })
    wk.add({
        { "[",  group = "Prev" },
        { "[b", ":bp<CR>",      desc = "Previous buffer" },
        { "[q", ":cprev<CR>zz", desc = "Previous quickfix" },
        { "]",  group = "Next" },
        { "]b", ":bn<CR>",      desc = "Next buffer" },
        { "]q", ":cnext<CR>zz", desc = "Next quickfix" },
    })
end

return M
