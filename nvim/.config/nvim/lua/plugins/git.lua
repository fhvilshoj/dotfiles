return {
  {
    "kdheepak/lazygit.nvim",
    keys = {
      { "<leader>gg", [[:LazyGit<CR>]], desc = "LazyGit" },
    },
  },
  {
    "tpope/vim-rhubarb",
  },
  {
    "tpope/vim-fugitive",
    lazy = false,
    keys = {

      { "<leader>Ge", ":GBrowse<CR>",       desc = "Open GH" },
      { "<leader>Gy", ":GBrowse!<CR>",      desc = "Copy GH" },
      { "<leader>Ge", ":'<,'>GBrowse<CR>",  desc = "Open ",   mode = "v" },
      { "<leader>Gy", ":'<,'>GBrowse!<CR>", desc = "Copy GH", mode = "v" },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      if not pcall(require, "gitsigns") then
        return
      end
      require("gitsigns").setup({
        on_attach = function(bufnr)
          gs = package.loaded.gitsigns
          if gs == nil then
            print("Nope")
            return
          end
          local success, wk = pcall(require, "which-key")
          if not success then
            print("Nope 2")
            return
          end
          wk.register({
            G = {
              s = { ":Gitsigns stage_hunk<CR>", "Stage hunk" },
              r = { ":Gitsigns reset_hunk<CR>", "Reset hunk" },
            },
          }, { mode = { "n", "v" } })

          wk.register({
            t = {
              name = "toggle",
              b = { gs.toggle_current_line_blame, "Git blame" },
              d = { gs.toggle_deleted, "Git deletes" },
            },
            G = {
              name = "Git",
              S = { gs.stage_buffer, "Stage buffer" },
              u = { gs.undo_stage_hunk, "Undo stage hunk" },
              r = { gs.reset_hunk, "Reset hunk" },
              R = { gs.reset_buffer, "Reset buffer" },
              p = { gs.preview_hunk, "Preview hunk" },
              b = {
                function()
                  gs.blame_line({ full = true })
                end,
                "Blame line",
              },
              d = { gs.diffthis, "Diff this" },
              D = {
                function()
                  gs.diffthis("~")
                end,
                "Diff this (~)",
              },
            },
          }, { prefix = "<leader>" })
          wk.register({
            ["]"] = {
              h = {
                function()
                  if vim.wo.diff then
                    return "]c"
                  end
                  vim.schedule(function()
                    gs.next_hunk()
                  end)
                  return "<Ignore>"
                end,
                "Next hunk",
              },
            },
            ["["] = {
              h = {
                function()
                  if vim.wo.diff then
                    return "[c"
                  end
                  vim.schedule(function()
                    gs.prev_hunk()
                  end)
                  return "<Ignore>"
                end,
                "Previous hunk",
              },
            },
          })
        end,
      })
    end,
  },
}
