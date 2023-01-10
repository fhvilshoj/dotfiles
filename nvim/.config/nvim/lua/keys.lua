-- [[ keys.lua ]]
local map = vim.api.nvim_set_keymap

nnoremap = function(t)
    vim.keymap.set("n", t[1], t[2], t[3])
end
vnoremap = function(t)
    vim.keymap.set("v", t[1], t[2], t[3])
end

--- Windows and buffers
map("n", "<C-h>", "<C-w>h", {})
map("n", "<C-l>", "<C-w>l", {})
map("n", "<C-j>", "<C-w>j", {})
map("n", "<C-k>", "<C-w>k", {})

-- Window resize
nnoremap({ "<M-j>", ":resize -2<CR>" })
nnoremap({ "<M-k>", ":resize +2<CR>" })
nnoremap({ "<M-h>", ":vertical resize -10<CR>" })
nnoremap({ "<M-l>", ":vertical resize +10<CR>" })

-- Yank
map("v", "<leader>yy", '"*y', {})

-- Quickfix
nnoremap({ "<leader>q[", ":cprev<CR>zz", {} })
nnoremap({ "<leader>q]", ":cnext<CR>zz", {} })

-- Scrolling
nnoremap({ "<C-d>", "<C-d>zz", {} })
nnoremap({ "<C-u>", "<C-u>zz", {} })
