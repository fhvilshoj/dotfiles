local M = {}

M.nnoremap = function(t)
    vim.keymap.set("n", t[1], t[2], t[3])
end

M.inoremap = function(t)
    vim.keymap.set("i", t[1], t[2], t[3])
end

M.vnoremap = function(t)
    vim.keymap.set("v", t[1], t[2], t[3])
end

M.xnoremap = function(t)
    vim.keymap.set("x", t[1], t[2], t[3])
end

M.cnoremap = function(t)
    vim.keymap.set("c", t[1], t[2], t[3])
end

M.map = function(t)
    vim.keymap.set("", t[1], t[2], { silent = true })
end

return M
