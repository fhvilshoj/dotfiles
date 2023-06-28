return {
  { "tpope/vim-dadbod" },
  {
    "kristijanhusak/vim-dadbod-ui",
    config = function()
      vim.g.db_ui_save_location = "~/.config/db_ui"
    end,
    keys = {
      { "<leader>Du", ":DBUIToggle<CR>",        desc = "Toggle DB UI" },
      { "<leader>Df", ":DBUIFindBuffer<CR>",    desc = "DB find buffer" },
      { "<leader>Dr", ":DBUIRenameBuffer<CR>",  desc = "DB rename buffer" },
      { "<leader>Dl", ":DBUILastQueryInfo<CR>", desc = "DB last query info" },
    },
  },
}
