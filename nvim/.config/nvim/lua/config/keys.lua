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
  wk.register({
    a = { name = "formatter", b = { "<cmd>'<,'>.!genericformat --format black<CR>", mode = { "v", "n" } } },
    b = { name = "buffer" },
    c = { name = "code" },
    D = { name = "DB" },
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
      y = { '"*y', "Yank to clipboard", mode = { "n", "v" } },
    },
    z = { name = "zettelkasten" },
  }, { prefix = "<leader>" })
  wk.register({
    ["["] = {
      name = "Prev",
      b = { ":bp<CR>", "Previous buffer" },
      q = { ":cprev<CR>zz", "Previous quickfix" },
    },
    ["]"] = {
      name = "Next",
      b = { ":bn<CR>", "Next buffer" },
      q = { ":cnext<CR>zz", "Next quickfix" },
    },
  })
end

return M
