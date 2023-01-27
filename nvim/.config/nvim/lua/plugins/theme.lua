return {
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
        opts = { options = { theme = "dracula-nvim" } },
    },

    {
        "rrethy/vim-hexokinase",
        build = "make hexokinase",
        lazy = false,
    },
}
