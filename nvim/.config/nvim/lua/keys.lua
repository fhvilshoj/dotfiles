-- [[ keys.lua ]]
local map = vim.api.nvim_set_keymap

nnoremap = function(t)
    vim.keymap.set("n", t[1], t[2], t[3])
end
vnoremap = function(t)
    vim.keymap.set("v", t[1], t[2], t[3])
end

-- Window resize
nnoremap({ "<C-J>", ":resize -2<CR>" })
nnoremap({ "<C-K>", ":resize +2<CR>" })
nnoremap({ "<C-H>", ":vertical resize -10<CR>" })
nnoremap({ "<C-L>", ":vertical resize +10<CR>" })

-- Yank
map("v", "<leader>yy", '"*y', {})

-- Quickfix
nnoremap({ "<leader>q[", ":cprev<CR>zz", {} })
nnoremap({ "<leader>q]", ":cnext<CR>zz", {} })

-- Scrolling
nnoremap({ "<C-d>", "<C-d>zz", {} })
nnoremap({ "<C-u>", "<C-u>zz", {} })
