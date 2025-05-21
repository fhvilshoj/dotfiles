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
                    wk.add({
                        { "Gr", ":Gitsigns reset_hunk<CR>", desc = "Reset hunk", mode = { "n", "v" } },
                        { "Gs", ":Gitsigns stage_hunk<CR>", desc = "Stage hunk", mode = { "n", "v" } },
                        {
                            "<leader>G",
                            function()
                                gs.diffthis("~")
                            end,
                            group = "Git",
                        },
                        { "<leader>GD", gs.diff,         desc = "Diff this (~)" },
                        { "<leader>GR", gs.reset_buffer, desc = "Reset buffer" },
                        { "<leader>GS", gs.stage_buffer, desc = "Stage buffer" },
                        {
                            "<leader>Gb",
                            function()
                                gs.blame_line({ full = true })
                            end,
                            desc = "Blame line",
                        },
                        { "<leader>Gd", gs.diffthis,                  desc = "Diff this" },
                        { "<leader>Gp", gs.preview_hunk,              desc = "Preview hunk" },
                        { "<leader>Gr", gs.reset_hunk,                desc = "Reset hunk" },
                        { "<leader>Gu", gs.undo_stage_hunk,           desc = "Undo stage hunk" },
                        { "<leader>t",  group = "toggle" },
                        { "<leader>tb", gs.toggle_current_line_blame, desc = "Git blame" },
                        { "<leader>td", gs.toggle_deleted,            desc = "Git deletes" },
                        {
                            "[h",
                            function()
                                if vim.wo.diff then
                                    return "[c"
                                end
                                vim.schedule(function()
                                    gs.prev_hunk()
                                end)
                                return "<Ignore>"
                            end,
                            desc = "Previous hunk",
                        },
                        {
                            "]h",
                            function()
                                if vim.wo.diff then
                                    return "]c"
                                end
                                vim.schedule(function()
                                    gs.next_hunk()
                                end)
                                return "<Ignore>"
                            end,
                            desc = "Next hunk",
                        },
                    })
                end,
            })
        end,
    },
}
