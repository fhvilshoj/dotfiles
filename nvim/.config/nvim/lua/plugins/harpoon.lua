return {
    {
        "ThePrimeagen/harpoon",
        dependencies = {
            "nvim-lua/popup.nvim",
            "nvim-lua/plenary.nvim",
        },
        keys = {
            { "<leader>hh", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", desc = "Harpoon menu" },
            { "<leader>ha", ":lua require('harpoon.mark').add_file()<CR>", desc = "Harpoon add" },
            { "<leader>hm", ":lua require('harpoon.ui').nav_file(1)<CR>", desc = "Harpoon(1)" },
            { "<leader>h,", ":lua require('harpoon.ui').nav_file(2)<CR>", desc = "Harpoon(2)" },
            { "<leader>h.", ":lua require('harpoon.ui').nav_file(3)<CR>", desc = "Harpoon(3)" },
            { "<leader>hj", ":lua require('harpoon.ui').nav_file(4)<CR>", desc = "Harpoon(4)" },
            { "<leader>hk", ":lua require('harpoon.ui').nav_file(5)<CR>", desc = "Harpoon(5)" },
            { "<leader>hl", ":lua require('harpoon.ui').nav_file(6)<CR>", desc = "Harpoon(6)" },
            { "<leader>hu", ":lua require('harpoon.ui').nav_file(7)<CR>", desc = "Harpoon(7)" },
            { "<leader>hi", ":lua require('harpoon.ui').nav_file(8)<CR>", desc = "Harpoon(8)" },
            { "<leader>ho", ":lua require('harpoon.ui').nav_file(9)<CR>", desc = "Harpoon(9)" },
        },
        -- opts = {
        --     menu = {
        --         width = vim.api.nvim_win_get_width(0) - 10,
        --     },
        -- },
    },
}
