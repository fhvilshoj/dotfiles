return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        keys = function()
            local harpoon = require("harpoon")
            harpoon:setup()

            return {
                {
                    "<leader>ha",
                    function()
                        harpoon:list():append()
                    end,
                    desc = "Harpoon add",
                },
                {
                    "<leader>hh",
                    function()
                        harpoon.ui:toggle_quick_menu(harpoon:list())
                    end,
                    desc = "Harpoon list",
                },
                {
                    "<leader>hm",
                    function()
                        harpoon:list():select(1)
                    end,
                    desc = "Harpoon(1)",
                },
                {
                    "<leader>h,",
                    function()
                        harpoon:list():select(2)
                    end,
                    desc = "Harpoon(2)",
                },
                {
                    "<leader>h.",
                    function()
                        harpoon:list():select(3)
                    end,
                    desc = "Harpoon(3)",
                },
                {
                    "<leader>hj",
                    function()
                        harpoon:list():select(4)
                    end,
                    desc = "Harpoon(4)",
                },
                {
                    "<leader>hk",
                    function()
                        harpoon:list():select(5)
                    end,
                    desc = "Harpoon(5)",
                },
                {
                    "<leader>hl",
                    function()
                        harpoon:list():select(6)
                    end,
                    desc = "Harpoon(6)",
                },
                {
                    "<leader>hu",
                    function()
                        harpoon:list():select(7)
                    end,
                    desc = "Harpoon(7)",
                },
                {
                    "<leader>hi",
                    function()
                        harpoon:list():select(8)
                    end,
                    desc = "Harpoon(8)",
                },
                {
                    "<leader>ho",
                    function()
                        harpoon:list():select(9)
                    end,
                    desc = "Harpoon(9)",
                },
            }
        end,
    },

    -- {
    --     "ThePrimeagen/harpoon",
    --     dependencies = {
    --         "nvim-lua/popup.nvim",
    --         "nvim-lua/plenary.nvim",
    --     },
    --     keys = {
    --         { "<leader>hh", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", desc = "Harpoon menu" },
    --         { "<leader>ha", ":lua require('harpoon.mark').add_file()<CR>", desc = "Harpoon add" },
    --         { "<leader>hm", ":lua require('harpoon.ui').nav_file(1)<CR>", desc = "Harpoon(1)" },
    --         { "<leader>h,", ":lua require('harpoon.ui').nav_file(2)<CR>", desc = "Harpoon(2)" },
    --         { "<leader>h.", ":lua require('harpoon.ui').nav_file(3)<CR>", desc = "Harpoon(3)" },
    --         { "<leader>hj", ":lua require('harpoon.ui').nav_file(4)<CR>", desc = "Harpoon(4)" },
    --         { "<leader>hk", ":lua require('harpoon.ui').nav_file(5)<CR>", desc = "Harpoon(5)" },
    --         { "<leader>hl", ":lua require('harpoon.ui').nav_file(6)<CR>", desc = "Harpoon(6)" },
    --         { "<leader>hu", ":lua require('harpoon.ui').nav_file(7)<CR>", desc = "Harpoon(7)" },
    --         { "<leader>hi", ":lua require('harpoon.ui').nav_file(8)<CR>", desc = "Harpoon(8)" },
    --         { "<leader>ho", ":lua require('harpoon.ui').nav_file(9)<CR>", desc = "Harpoon(9)" },
    --     },
    --     -- opts = {
    --     --     menu = {
    --     --         width = vim.api.nvim_win_get_width(0) - 10,
    --     --     },
    --     -- },
    -- },
}
