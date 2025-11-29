return {
    { "echasnovski/mini.icons",     version = "*" },
    { "nvim-tree/nvim-web-devicons" },

    {
        "Mofiqul/dracula.nvim",
        lazy = false,
        config = function()
            vim.api.nvim_command("colorscheme dracula")
        end,
    },

    {
        "nvim-lualine/lualine.nvim", -- statusline
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "Mofiqul/dracula.nvim",
        },
        lazy = false,
        config = function()
            local word_count = function()
                return tostring(vim.fn.wordcount().words)
            end

            require("lualine").setup({
                options = {
                    theme = "dracula-nvim",
                },
                sections = {
                    lualine_a = { { "FugitiveHead", icon = "" } },
                    lualine_b = { word_count },
                },
            })
        end,
    },
}
